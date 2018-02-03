#!/usr/bin/env python3
import os
import pathlib
import re
import urllib
import boto3
import queue
import threading
import hashlib
import xml.etree.ElementTree as ET

import requests
import yaml

import pdb

class ModDownloader(object):
    def __init__(self, threads=16):  # {{{
        self.s3_client = boto3.client('s3')
        self.dynamodb = boto3.resource('dynamodb',
                                       region_name='eu-west-1')

        self.dynamo_db_table = 'minecraft_mod_file_meta'
        self.mod_bucket = 'minecraft.redwood-guild.com'
        self.bucket_path = 'packs/sprouted/mods/'

        self.mods_path = os.path.join(os.getcwd(), 'mods')
        self.mod_url_regex = re.compile(r"^https:\/\/minecraft\.curseforge\.com\/projects\/(?P<projectID>.+)\/files\/(?P<fileID>[0-9]+).*")

        self.make_app_dirs()
        self.existing_mods = self.get_existing_mods()

        self.load_mods_yaml()

        self.auth_cookie = None

        self.minecraft_version = '1.10.2'

        self.mod_download_queue = queue.Queue()
        self.max_threads = threads
        self.threads = []
        # }}}

    def make_app_dirs(self):  # {{{
        if not os.path.exists(self.mods_path):
            os.makedirs(self.mods_path)

        print("Mods path: %s" % (self.mods_path))  # }}}

    def get_mod_metadata(self, modUrl):  # {{{
        mod = {}
        mod['url'] = modUrl

        match = self.mod_url_regex.search(modUrl)
        if not match:
            print("{} did not match mod regex, skipping".format(modUrl))
            return 1

        mod['projectID'] = match.group('projectID')
        mod['fileID'] = match.group('fileID')

        return mod
    # }}}

    def download_mod(self, mod):  # {{{
        sess = requests.session()

        projectResponse = sess.get(
            "https://minecraft.curseforge.com/projects/{}".format(
                mod['projectID']),
            stream=True,
            allow_redirects=False
        )

        if not self.auth_cookie:
            for redirect in sess.resolve_redirects(
                    projectResponse,
                    projectResponse.request
                    ):
                sess.cookies.update({'Auth.Token': auth_cookie})
                if redirect.headers.get('Set-Cookie') is not None:
                    cookie_list = redirect.headers.get('Set-Cookie').split(";")[0].split("=")
                if cookie_list[0] == 'Auth.Token':
                    auth_cookie = cookie_list[1]
                projectResponse.url = redirect.url

        fileResponse = sess.get("%s/files/%s/download" %
                                (projectResponse.url, mod['fileID']),
                                stream=True
                                )
        while fileResponse.is_redirect:
            source = fileResponse
            fileResponse = sess.get(source, stream=True)
        filePath = pathlib.Path(fileResponse.url)
        fileName = urllib.parse.unquote(filePath.name)

        if fileName in self.existing_mods:
            print("{} already exists... skipping.".format(fileName))
            return None

        modDownloadPath = os.path.join(self.mods_path, fileName)
        print("Downloading {} to {}".format(mod['projectID'], modDownloadPath))

        with open(modDownloadPath, "wb") as mod_file:
            mod_file.write(fileResponse.content)

        mod['filename'] = fileName

        return mod
        # }}}

    def get_file_meta(self, mod_file_name):  # {{{
        meta = self.dynamodb.Table(self.dynamo_db_table)
        response = meta.get_item(Key={'Filename': mod_file_name})
        mod_meta = response['Item']
        return mod_meta  # }}}

    def mod_download_worker(self):  # {{{
        while True:
            mod = self.mod_download_queue.get()
            if mod is None:
                break

            for version in self.mods[mod]['versions']:
                mod_meta = self.get_mod_metadata(
                        self.mods[mod]['versions'][version]['url'])
                mod_meta = self.download_mod(mod_meta)

                if mod_meta:
                    file_meta = self.get_mod_file_meta(mod_meta['filename'])
                    self.upload_mod(mod_meta)

                    self.put_mod_file_meta(file_meta)

            self.mod_download_queue.task_done()  # }}}

    def get_mod_file_meta(self, filename):  # {{{
        meta = {}
        meta['filename'] = filename

        mod_file_path = os.path.join(self.mods_path, filename)

        meta['size'] = os.stat(mod_file_path).st_size

        m = hashlib.md5()
        with open(mod_file_path, 'rb') as modFile:
            m.update(modFile.read())
        meta['md5'] = m.hexdigest()

        return meta
    # }}}

    def download_mods(self):  # {{{
        for mod in self.mods:
            self.mod_download_queue.put(mod)

        for thread in range(self.max_threads):
            t = threading.Thread(target=self.mod_download_worker)
            t.start()
            self.threads.append(t)

        self.mod_download_queue.join()

        for thread in range(self.max_threads):
            self.mod_download_queue.put(None)
        for thread in self.threads:
            thread.join()
    # }}}

    def get_existing_mods(self):  # {{{
        s3_objects = self.s3_client.list_objects(Bucket=self.mod_bucket,
                                           Prefix=self.bucket_path
                                           )
        mods = []

        if s3_objects and 'Contents' in s3_objects:
            for s3_object in s3_objects['Contents']:
                mod = s3_object['Key']
                mod = mod[mod.rfind('/')+1:]
                mods.append(mod)

        return mods  # }}}

    def load_version_yamls(self):# {{{
        self.versions = {}

        # list files in pack-versions
        files = os.listdir('pack-versions')
        for cur_file in files:
            if cur_file.rfind('.yaml') or cur_file.rfind('.yml'):
                with open(
                        os.path.join('pack-versions', cur_file),
                        'rb') as yamlFile:
                    version_yaml = yaml.load(yamlFile)
                version_num = next(iter(version_yaml.keys()))
                self.versions[version_num] = version_yaml[version_num]# }}}

    def generate_versions_xmls(self):# {{{
        for version in self.versions:
            self.generate_version_xml(version)# }}}

    def generate_version_xml(self, version):  # {{{
        xml = ET.Element('ServerPack')
        xml.set('version', '3.4')
        xml.set('xmlns', 'http://www.mcupdater.com')
        xml.set('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')
        xml.set('xsi:schemaLocation', 'http://www.mcupdater.com http://files.mcupdater.com/ServerPackv2.xsd')
        et = ET.ElementTree(element=xml)

        # Create Server Element
        serverelem = ET.Element('Server')
        serverelem.set('id', version)
        serverelem.set('version', self.minecraft_version)
        serverelem.set('abstract', 'true')
        xml.append(serverelem)

        version_mods = self.versions[version]

        for mod in version_mods:# {{{
            mod_elem = ET.Element('Module')
            mod_elem.set('name', mod)
            mod_elem.set('id', mod)

            mod_elem.set('depends', self.mods[mod]['depends'])
            mod_elem.set('side', self.mods[mod]['side'])

            # Load version url from database
            # mod_url = ET.Element('URL')
            # mod_url.set('priority', '0')
            # mod_url.text = self.mods[mod]['versions'][version_mods[mod]]['url']
            # mod_elem.append(mod_url)

            # Load mod version size from database
            mod_size = ET.Element('Size')
            pdb.set_trace()
            mod_size.text = self.mods[mod]['versions'][version_mods[mod]]['version']['size']
            mod_elem.append(mod_size)

            mod_required = ET.Element('Required')
            mod_required.text = version_mods[mod]['required']
            mod_elem.append(mod_required)

            mod_type = ET.Element('ModType')
            mod_type.text = self.mods[mod]['type']
            mod_elem.append(mod_type)

            mod_md5 = ET.Element('MD5')
            mod_md5.text = self.mods[mod]['versions'][version_mods[mod]]['version']['md5']
            mod_elem.append(mod_md5)

            # Mod Meta
            mod_meta = ET.Element('Meta')

            mod_credits = ET.Element('credits')
            mod_credits.text = self.mods[mod]['credits']
            mod_meta.append(mod_credits)

            mod_description = ET.Element('description')
            mod_description.text = self.mods[mod]['description']
            mod_meta.append(mod_description)

            mod_version = ET.Element('version')
            mod_version.text = version_mods[mod]['version']
            mod_meta.append(mod_version)

            mod_meta_url = ET.Element('url')
            mod_meta_url.text = self.mods[mod]['url']
            mod_meta.append(mod_meta_url)

            mod_authors = ET.Element('authors')
            mod_authors.text = self.mods[mod]['authors']
            mod_meta.append(mod_authors)

            mod_elem.append(mod_meta)
            serverelem.append(mod)# }}}

        et.write('{}.xml'.format(version),
                 encoding='utf-8',
                 xml_declaration=True)
    # }}}

    def generate_root_xml(self, versions):# {{{

        # Create root ServerPack element
        xml = ET.Element('ServerPack')
        xml.set('version', '3.4')
        xml.set('xmlns', 'http://www.mcupdater.com')
        xml.set('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')
        xml.set('xsi:schemaLocation', 'http://www.mcupdater.com http://files.mcupdater.com/ServerPackv2.xsd')
        et = ET.ElementTree(element=xml)

        # Create Server Element
        serverelem = ET.Element('Server')
        serverelem.set('id', 'sprouted-1.10.2')
        serverelem.set('abstract', 'false')
        serverelem.set('name', 'Sprouted - 1.10.2')
        serverelem.set('newsUrl', 'https://minecraft.redwood-guild.com/packs/sprouted-1.10.2/news.html')
        serverelem.set('version', '1.10.2')
        serverelem.set('generateList', 'true')
        serverelem.set('autoConnect', 'true')
        serverelem.set('revision', '1')
        serverelem.set('mainClass', 'net.minecraft.launchwrapper.Launch')
        serverelem.set('launcherType', 'Vanilla')
        serverelem.set('serverAddress', 'sprouted.minecraft.redwood-guild.com')
        xml.append(serverelem)

        for version in versions:
            importelem = ET.Element('Import')
            importelem.set('url', 'http://minecraft.redwood-guild.com/packs/sprouted-1.10.2/{}.xml'.format(
                version['version']
                ))
            importelem.text = version['version']
            serverelem.append(importelem)
        et.write('pack.xml', encoding='utf-8', xml_declaration=True)# }}}

    def upload_mod(self, mod):  # {{{
        print('Uploading {} to s3://{}{}{}'.format(
            mod['filename'],
            self.mod_bucket,
            self.bucket_path,
            mod['filename']
            ))
        with open('{}/{}'.format(self.mods_path, mod['filename']), 'rb') as modFile:
            self.s3_client.put_object(
                ACL='public-read',
                Bucket=self.mod_bucket,
                Key='{}{}'.format(
                    self.bucket_path,
                    mod['filename']
                ),
                Body=modFile
            )  # }}}

    def load_mods_yaml(self):# {{{
        with open('mods.yaml', 'rb') as modsYaml:
            self.mods = yaml.load(modsYaml)# }}}

    def put_mod_file_meta(self, meta):  # {{{
        meta_table = self.dynamodb.Table(self.dynamo_db_table)

        meta_table.put_item(
            Item={
                'Filename': meta['filename'],
                'size': meta['size'],
                'MD5': meta['md5']
                })
    # }}}

if __name__ == '__main__':
    md = ModDownloader()
    md.load_version_yamls()
    md.download_mods()
    pdb.set_trace()
    #md.generate_versions_xmls()
