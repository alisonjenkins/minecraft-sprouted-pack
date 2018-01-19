#!/usr/bin/env python3
import os
import pathlib
import pdb
import re
import shutil
import urllib

from appdirs import *
import requests


class ModDownloader(object):
    def __init__(self):# {{{
        # appdirs code
        self.appname = 'modDownloader'
        self.appauthor = 'alanjenkins'

        self.mods_path = os.path.join(user_data_dir(self.appname, self.appauthor), 'mods')
        self.cache_path  = user_cache_dir(self.appname, self.appauthor)
        self.mod_url_regex = re.compile(r"^https:\/\/minecraft\.curseforge\.com\/projects\/(?P<projectID>.+)\/files\/(?P<fileID>[0-9]+).*")
        # make appdirs
        self.make_app_dirs()
        # }}}

    def make_app_dirs(self):# {{{
        if not os.path.exists(self.cache_path):
            os.makedirs(self.cache_path)

        print("Cache path: %s" % (self.cache_path))

        if not os.path.exists(self.mods_path):
            os.makedirs(self.mods_path)

        print("Mods path: %s" % (self.mods_path))# }}}

    def get_mod_metadata(self, modUrl):# {{{
        mod = {}
        mod['url'] = modUrl

        match = self.mod_url_regex.search(modUrl)
        if not match:
            print("{} did not match mod regex, skipping".format(modUrl))
            return 1

        mod['projectID'] = match.group('projectID')
        mod['fileID'] = match.group('fileID')
        mod['cache_dir'] = pathlib.Path(os.path.join(self.cache_path, str(mod['projectID']), str(mod['fileID'])))

        return mod# }}}

    def download_mod(self, mod):# {{{
        sess = requests.session()

        # check if mod is cached
        if mod['cache_dir'].is_dir():
            # File is cached
            modFiles = [f for f in mod['cache_dir'].iterdir()]
            if len(modFiles) >= 1:
                modFile = modFiles[0]
                targetFile = os.path.join(self.mods_path, modFile.name)
                shutil.copyfile(str(modFile), str(targetFile))

                # Cache access is successful,
                # Don't download the file
                print("{} in cache, not downloading.".format(mod['url']))
                return 0

        # File is not cached and needs to be downloaded
        projectResponse = sess.get("https://minecraft.curseforge.com/projects/%s" % (mod['projectID']), stream=True, allow_redirects=False)
        
        auth_cookie = None
        for redirect in sess.resolve_redirects(projectResponse, projectResponse.request):
             sess.cookies.update({'Auth.Token': auth_cookie})
             if redirect.headers.get('Set-Cookie') is not None:
                  cookie_list = redirect.headers.get('Set-Cookie').split(";")[0].split("=")
                  if cookie_list[0] == 'Auth.Token':
                        auth_cookie = cookie_list[1]
             projectResponse.url = redirect.url

        fileResponse = sess.get("%s/files/%s/download" % (projectResponse.url, mod['fileID']), stream=True)
        while fileResponse.is_redirect:
            source = fileResponse
            fileResponse = sess.get(source, stream=True)
        filePath = pathlib.Path(fileResponse.url)
        fileName = urllib.parse.unquote(filePath.name)

        modDownloadPath = os.path.join(self.mods_path, fileName)
        print("Downloading {} to {}".format(mod['projectID'], modDownloadPath))

        with open(modDownloadPath, "wb") as mod_file:
            mod_file.write(fileResponse.content)

        # Try to add file to cache.
        if not os.path.exists(mod['cache_dir']):
            os.makedirs(mod['cache_dir'])
            cache_file_path = os.path.join(mod['cache_dir'], fileName)
            with open(cache_file_path, "wb") as mod_file:
                mod_file.write(fileResponse.content)# }}}

    def get_mods_list(self, path):# {{{
        with open(path, 'r') as modUrlsFile:
            modUrls = modUrlsFile.read().strip().split('\n')# }}}
        return modUrls

    def download_mods(self, modUrls):# {{{
        for modUrl in modUrls:
            mod = self.get_mod_metadata(modUrl)
            self.download_mod(mod)# }}}

if __name__ == '__main__':
    md = ModDownloader()
    mod_urls = md.get_mods_list('modsList.txt')
    #pdb.set_trace()
    md.download_mods(mod_urls)
