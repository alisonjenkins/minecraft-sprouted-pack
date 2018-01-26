#!/usr/bin/env python3
import os
import pathlib
import re
import shutil
import urllib
import boto3

import requests


class ModDownloader(object):
    def __init__(self):# {{{
        self.s3_client = boto3.client('s3')

        self.mod_bucket = 'minecraft.redwood-guild.com'
        self.bucket_path = '/packs/sprouted/mods/'

        self.mods_path = os.path.join(os.getcwd(), 'mods')
        self.mod_url_regex = re.compile(r"^https:\/\/minecraft\.curseforge\.com\/projects\/(?P<projectID>.+)\/files\/(?P<fileID>[0-9]+).*")

        self.make_app_dirs()
        self.existing_mods = self.get_existing_mods()
        # }}}

    def make_app_dirs(self):# {{{
        if not os.path.exists(self.mods_path):
            os.makedirs(self.mods_path)

        print("Mods path: %s" % (self.mods_path))# }}}

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
            "https://minecraft.curseforge.com/projects/%s".format(
                mod['projectID']),
            stream=True,
            allow_redirects=False
        )

        auth_cookie = None
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
            return 0

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
        return modUrls
    # }}}

    def download_mods(self, modUrls):  # {{{
        for modUrl in modUrls:
            mod = self.get_mod_metadata(modUrl)
            mod = self.download_mod(mod)
            self.upload_mod(mod)
    # }}}

    def get_existing_mods(self):  # {{{
        return self.client.list_objects(Bucket=self.mod_bucket,
                                        Prefix=self.bucket_path
                                        )  # }}}

    def generate_xml():
        pass

    def upload_mod(self, mod):  # {{{
        print('Uploading {} to s3://{}/{}{}'.format(
            mod['filename'],
            self.mod_bucket,
            self.bucket_path,
            mod['filename']
            ))
        with open('{}/{}'.format(self.mods_path, mod['filename'])) as modFile:
            self.s3client.put_object(
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
