#   json_writer.py is a prototype file writer which reads package sources and writes
#   a json file including them in a specific format.


# URL reading cited from https://www.geeksforgeeks.org/python/how-to-download-files-from-urls-with-python/
# handling new tar file cited from https://www.geeksforgeeks.org/python/how-to-uncompress-a-tar-gz-file-using-python/
import wget
import tarfile
import os
from time import sleep


# get all urls
f = open("package-sources")
strings = f.readlines()
f.close()
out = open("pkg.json", "w")
out.write('[\n')
scripts = os.listdir('./')
#os.mkdir('./tempfolder')
index = 0
for x in strings:
    #if index != 0 :
    #    out.write(',\n')
    #else: 
    #    out.write('\t{')
    try:
        response = wget.download(x, bar=None)
    except wget.URLError:
        print(x + " failed")

    #print(response)
    #if response.status_code == 200:
    #    with open('file.tar.gz', 'wb') as file:
    #        file.write(response.content)
    #    file = tarfile.open('file.tar.gz')
    #    name = file.getnames()[1].split('/')[0]
    #    file.close()
        #print(name)
    #    package = os.listdir('./tempfolder')
        #print(package)

    info = response.split('-')
    index = 0
    while(scripts[index].find(info[0].replace('_','-')) == -1):
        index = index + 1
    out.write('\t{\n\t\t\"name\": \"' + info[0] + '\",\n\t\t\"link\": \"' + x.split('\n')[0] + '\",\n\t\t\"version\": \"' + info[1] + '\",\n\t\t\"script\": \"' + scripts[index] + '\",\n\t\t\"deps\": []\n\t}')
    os.remove(response)
    #else:
    #    print(x.split('\n')[0] + ' failed to open\ncode : ' + str(response.status_code))
    index = index + 1
out.write(']\n')
#os.rmdir('./tempfolder')






#class pkg:
#    def __init__(self, name, version, link):
#        self.name = name
#        self.version = version
#        self.link = link