#!/usr/bin/env python3
import os
import pathlib
import re
import urllib
import urllib.request
import boto3
import queue
import threading
import hashlib
import xml.etree.ElementTree as ET
import sys
import zipfile
import pathlib
from xml.sax.saxutils import escape as xml_escape

import requests
import yaml

import pdb


class ModDownloader(object):
    def __init__(self,  # {{{
                 pack_name='sprouted-1.10.2',
                 pack_pretty_name='Sprouted - 1.10.2',
                 server_hostname='sprouted.minecraft.redwood-guild.com',
                 minecraft_version='1.10.2',
                 minecraft_forge_version='12.18.3.2477',
                 threads=16
                 ):
        self.s3_client = boto3.client('s3')
        self.dynamodb = boto3.resource('dynamodb',
                                       region_name='eu-west-1')

        self.pack_name = pack_name
        self.pack_pretty_name = pack_pretty_name
        self.server_hostname = 'sprouted.minecraft.redwood-guild.com'
        self.dynamo_db_table = 'minecraft_mod_file_meta'
        self.mod_bucket = 'minecraft.redwood-guild.com'
        self.bucket_path = 'mods/'
        self.xml_bucket_path = 'packs/{}/'.format(self.pack_name)

        self.mods_path = os.path.join(os.getcwd(), 'mods')
        self.mod_url_regex = re.compile(r"^https:\/\/minecraft\.curseforge\.com\/projects\/(?P<projectID>.+)\/files\/(?P<fileID>[0-9]+).*")

        self.make_app_dirs()
        self.existing_mods = self.get_existing_mods()

        self.load_mods_yaml()

        self.auth_cookie = None

        self.minecraft_version = minecraft_version
        self.minecraft_forge_version = minecraft_forge_version

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
            return mod

        mod['projectID'] = match.group('projectID')
        mod['fileID'] = match.group('fileID')

        return mod
    # }}}

    def download_mod(self, mod):  # {{{


        sess = requests.session()

        if 'type' in self.mods[mod['mod_name']]['versions'][mod['mod_version']] and self.mods[mod['mod_name']]['versions'][mod['mod_version']]['type'] == 'direct':
            print('Starting Direct download of mod: {} version {}'.format(mod['mod_name'], mod['mod_version']))
            projectResponse = sess.get(
                mod['url'],
                stream=True,
                allow_redirects=False
            )
        else:
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

        if 'type' in self.mods[mod['mod_name']]['versions'][mod['mod_version']] and self.mods[mod['mod_name']]['versions'][mod['mod_version']]['type'] == 'direct':
            fileResponse = sess.get(mod['url'],
                                    stream=True
                                    )
        else:
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
        if 'type' in self.mods[mod['mod_name']]['versions'][mod['mod_version']] and self.mods[mod['mod_name']]['versions'][mod['mod_version']]['type'] == 'direct':
            print("Downloading {} to {}".format(mod['mod_name'], modDownloadPath))
        else:
            print("Downloading {} to {}".format(mod['projectID'], modDownloadPath))

        with open(modDownloadPath, "wb") as mod_file:
            mod_file.write(fileResponse.content)

        mod['filename'] = fileName

        return mod
        # }}}

    def get_file_meta(self, mod, version):  # {{{
        meta = self.dynamodb.Table(self.dynamo_db_table)
        response = meta.get_item(
                Key={
                    'ModName': str(mod),
                    'Version': str(version)
                    })
        if 'Item' not in response:
            print("ERROR getting file metadata for {} version {}. Aborting".format(
                mod,
                version
            ))
            pdb.set_trace()
            sys.exit(1)
        mod_meta = response['Item']
        return mod_meta  # }}}

    def mod_download_worker(self):  # {{{
        while True:
            mod = self.mod_download_queue.get()
            if mod is None:
                break

            if 'versions' not in self.mods[mod]:
                print("{} is missing versions key".format(mod))
                self.mod_download_queue.task_done()
                continue

            for version in self.mods[mod]['versions']:
                mod_meta = self.get_mod_metadata(
                        self.mods[mod]['versions'][version]['url'])
                mod_meta['mod_name'] = mod
                mod_meta['mod_version'] = version
                mod_meta = self.download_mod(mod_meta)

                if mod_meta:
                    file_meta = self.get_mod_file_meta(mod_meta['filename'])
                    file_meta['mod_name'] = mod
                    file_meta['version'] = version
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
            mod_elem.set('name', xml_escape(mod))
            mod_elem.set('id', xml_escape(mod))

            if 'depends' in self.mods[mod]:
                if self.mods[mod]['depends']:
                    mod_elem.set('depends', xml_escape(self.mods[mod]['depends']))
            mod_elem.set('side', xml_escape(self.mods[mod]['side']))

            mod_meta_data = self.get_file_meta(mod, version_mods[mod]['version'])

            mod_url = ET.Element('URL')
            mod_url.set('priority', xml_escape('0'))
            mod_url.text = xml_escape('http://minecraft.redwood-guild.com/mods/{}'.format(mod_meta_data['Filename']))
            mod_elem.append(mod_url)

            # Load mod version size from database
            mod_size = ET.Element('Size')
            mod_size.text = xml_escape(str(mod_meta_data['size']))
            mod_elem.append(mod_size)

            mod_required = ET.Element('Required')
            mod_required.text = xml_escape(str(version_mods[mod]['required']))
            mod_elem.append(mod_required)

            mod_type = ET.Element('ModType')
            mod_type.text = xml_escape(str(self.mods[mod]['mod-type']))
            mod_elem.append(mod_type)

            mod_md5 = ET.Element('MD5')
            mod_md5.text = xml_escape(str(mod_meta_data['MD5']))
            mod_elem.append(mod_md5)

            # Mod Meta
            mod_meta = ET.Element('Meta')

            if 'credits' in self.mods[mod]:
                if self.mods[mod]['credits']:
                    mod_credits = ET.Element('credits')
                    mod_credits.text = xml_escape(self.mods[mod]['credits'])
                    mod_meta.append(mod_credits)
                else:
                    print("WARNING: {} is missing credits.".format(mod))

            else:
                print("WARNING: {} is missing credits.".format(mod))

            if 'description' in self.mods[mod]:
                if self.mods[mod]['description']:
                    mod_description = ET.Element('description')
                    mod_description.text = xml_escape(self.mods[mod]['description'])
                    mod_meta.append(mod_description)
                else:
                    print("WARNING: {} is missing a description.".format(mod))
            else:
                print("WARNING: {} is missing description.".format(mod))

            mod_version = ET.Element('version')
            mod_version.text = str(version_mods[mod]['version'])
            mod_meta.append(mod_version)

            if 'url' in self.mods[mod]:
                if self.mods[mod]['url']:
                    mod_meta_url = ET.Element('url')
                    mod_meta_url.text = xml_escape(self.mods[mod]['url'])
                    mod_meta.append(mod_meta_url)
                else:
                    print("WARNING: {} is missing a url.".format(mod))
            else:
                print("WARNING: {} is missing url.".format(mod))

            if 'authors' in self.mods[mod]:
                if self.mods[mod]['url']:
                    mod_authors = ET.Element('authors')
                    mod_authors.text = xml_escape(self.mods[mod]['authors'])
                    mod_meta.append(mod_authors)
                else:
                    print("WARNING: {} is missing authors.".format(mod))
            else:
                print("WARNING: {} is missing authors.".format(mod))

            mod_elem.append(mod_meta)
            serverelem.append(mod_elem)
            # }}}

        et.write('{}.xml'.format(str(version)),
                 encoding='utf-8',
                 xml_declaration=True)
    # }}}

    def generate_configs_zip(self):  # {{{
        configs_dir = 'configs'
        zip_name = 'configs.zip'
        self.configs = {}
        self.configs['zip_name'] = 'configs.zip'
        self.configs['path'] = '{}{}'.format(
                self.xml_bucket_path,
                self.configs['zip_name']
        )

        src_path = pathlib.Path(configs_dir).expanduser().resolve(strict=True)
        with zipfile.ZipFile(zip_name, 'w', zipfile.ZIP_DEFLATED) as zf:
            for file in src_path.rglob('*'):
                zf.write(file, file.relative_to(src_path))

        with open(zip_name, 'rb') as zf:
            m = hashlib.md5()
            m.update(zf.read())
            self.configs['md5'] = m.hexdigest()

        print('Uploading {} to s3://{}{}'.format(
            self.configs['zip_name'],
            self.mod_bucket,
            self.configs['path']
            ))
        with open(self.configs['zip_name'], 'rb') as zf:
            self.s3_client.put_object(
                ACL='public-read',
                Bucket=self.mod_bucket,
                Key=self.configs['path'],
                StorageClass='REDUCED_REDUNDANCY',
                Body=zf
            )
    # }}}

    def generate_root_xml(self):  # {{{
        # Create root ServerPack element
        xml = ET.Element('ServerPack')
        xml.set('version', xml_escape('3.4'))
        xml.set('xmlns', xml_escape('http://www.mcupdater.com'))
        xml.set('xmlns:xsi', xml_escape('http://www.w3.org/2001/XMLSchema-instance'))
        xml.set('xsi:schemaLocation', xml_escape('http://www.mcupdater.com http://files.mcupdater.com/ServerPackv2.xsd'))
        et = ET.ElementTree(element=xml)

        # Create Server Element
        serverelem = ET.Element('Server')
        serverelem.set('id', xml_escape(self.pack_name))
        serverelem.set('abstract', xml_escape('false'))
        serverelem.set('name', xml_escape(self.pack_pretty_name))
        #serverelem.set('newsUrl', xml_escape('http://minecraft.redwood-guild.com/packs/{}/pack.xml'.format(self.pack_name)))
        serverelem.set('version', xml_escape('1.10.2'))
        serverelem.set('generateList', xml_escape('true'))
        serverelem.set('autoConnect', xml_escape('true'))
        serverelem.set('revision', xml_escape('1'))
        serverelem.set('mainClass', xml_escape('net.minecraft.launchwrapper.Launch'))
        serverelem.set('launcherType', xml_escape('Vanilla'))
        serverelem.set('serverAddress', xml_escape(self.server_hostname))
        xml.append(serverelem)

        forgeimportelem = ET.Element('Import')
        forgeimportelem.set('url',
                            'http://files.mcupdater.com/example/forge.php?mc={}&forge={}'.format(
                                self.minecraft_version,
                                self.minecraft_forge_version
        ))
        forgeimportelem.text = 'forge'
        serverelem.append(forgeimportelem)

        for version in self.versions:
            importelem = ET.Element('Import')
            importelem.set('url', 'http://minecraft.redwood-guild.com/packs/{}/{}.xml'.format(
                xml_escape(str(self.pack_name)),
                xml_escape(str(version))
                ))
            importelem.text = xml_escape(str(version))
            serverelem.append(importelem)

        configselem = ET.Element('Module')
        configselem.set('id', xml_escape('configs'))
        configselem.set('name', xml_escape('config files'))
        configsurlelem = ET.Element('URL')
        configsurlelem.text = xml_escape(
                'http://minecraft.redwood-guild.com/{}'.format(self.configs['path'])
        )
        configselem.append(configsurlelem)

        configsrequired = ET.Element('Required')
        configsrequired.text = 'true'
        configselem.append(configsrequired)

        configsmodtype = ET.Element('ModType')
        configsmodtype.set('inRoot', 'true')
        configsmodtype.text = 'Extract'

        configselem.append(configsmodtype)

        configsmd5elem = ET.Element('MD5')
        configsmd5elem.text = xml_escape(self.configs['md5'])
        configselem.append(configsmd5elem)

        serverelem.append(configselem)

        et.write('pack.xml', encoding='utf-8', xml_declaration=True)
        # }}}

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
                StorageClass='REDUCED_REDUNDANCY',
                Body=modFile
            )  # }}}

    def load_mods_yaml(self):# {{{
        with open('mods.yaml', 'rb') as modsYaml:
            self.mods = yaml.load(modsYaml)# }}}

    def put_mod_file_meta(self, meta):  # {{{
        meta_table = self.dynamodb.Table(self.dynamo_db_table)

        meta_table.put_item(
            Item={
                'Filename': str(meta['filename']),
                'Version': str(meta['version']),
                'ModName': str(meta['mod_name']),
                'size': int(meta['size']),
                'MD5': str(meta['md5'])
                })
    # }}}

    def upload_xmls(self):  # {{{
        files = os.listdir()
        for cur_file in files:
            if cur_file.rfind('.xml') != -1:
                upload_path = '{}{}'.format(
                    self.xml_bucket_path,
                    cur_file
                )
                print('Uploading {} XML to {}'.format(
                    cur_file,
                    upload_path
                ))
                with open(cur_file, 'rb') as xmlFile:
                    self.s3_client.put_object(
                        ACL='public-read',
                        Bucket=self.mod_bucket,
                        StorageClass='REDUCED_REDUNDANCY',
                        Key=upload_path,
                        Body=xmlFile
                    )
    # }}}


if __name__ == '__main__':
    md = ModDownloader()
    md.load_version_yamls()
    md.download_mods()
    md.generate_configs_zip()
    md.generate_versions_xmls()
    md.generate_root_xml()
    md.upload_xmls()
