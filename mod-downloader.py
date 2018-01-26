#!/usr/bin/env python3
import os
import pathlib
import re
import pdb
import shutil
import urllib
import boto3
import queue
import threading

import requests


class ModDownloader(object):
    def __init__(self, no_aws=False, threads=16):  # {{{
        self.no_aws = no_aws
        if not no_aws:
            self.s3_client = boto3.client('s3')

        self.mod_bucket = 'minecraft.redwood-guild.com'
        self.bucket_path = 'packs/sprouted/mods/'

        self.mods_path = os.path.join(os.getcwd(), 'mods')
        self.mod_url_regex = re.compile(r"^https:\/\/minecraft\.curseforge\.com\/projects\/(?P<projectID>.+)\/files\/(?P<fileID>[0-9]+).*")

        self.make_app_dirs()
        self.existing_mods = self.get_existing_mods()

        self.auth_cookie = None

        self.download_queue = queue.Queue()
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

    def get_mods_list(self, path):  # {{{
        with open(path, 'r') as modUrlsFile:
            modUrls = modUrlsFile.read().strip().split('\n')

        for modUrl in modUrls:
            self.download_queue.put(modUrl)

        return modUrls
    # }}}

    def download_worker(self):  # {{{
        while True:
            modUrl = self.download_queue.get()
            if modUrl is None:
                break
            mod = self.get_mod_metadata(modUrl)
            mod = self.download_mod(mod)

            if not self.no_aws and mod:
                self.upload_mod(mod)

            self.download_queue.task_done()  # }}}

    def download_mods(self, modUrls):  # {{{
        for thread in range(self.max_threads):
            t = threading.Thread(target=self.download_worker)
            t.start()
            self.threads.append(t)
        # for modUrl in modUrls:
        #     mod = self.get_mod_metadata(modUrl)
        #     mod = self.download_mod(mod)
        self.download_queue.join()
        for thread in range(self.max_threads):
            self.download_queue.put(None)
        for thread in self.threads:
            thread.join()
    # }}}

    def get_existing_mods(self):  # {{{
        if not self.no_aws:
            s3_objects = self.s3_client.list_objects(Bucket=self.mod_bucket,
                                               Prefix=self.bucket_path
                                               )
            mods = []

            if s3_objects and 'Contents' in s3_objects:
                for s3_object in s3_objects['Contents']:
                    mod = s3_object['Key']
                    mod = mod[mod.rfind('/')+1:]
                    mods.append(mod)

            return mods
        else:
            return []  # }}}

    def generate_xml():
        pass

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


if __name__ == '__main__':
    md = ModDownloader()
    mod_urls = md.get_mods_list('modsList.txt')
    md.download_mods(mod_urls)
