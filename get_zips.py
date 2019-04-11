#!/usr/bin/env python
from bs4 import BeautifulSoup
import requests, os

# get page URL
BASE_URL = "https://www.fcc.gov/"
URL = "https://www.fcc.gov/general/broadband-deployment-data-fcc-form-477"
html = requests.get(URL).content

soup = BeautifulSoup(html)

def make_dir(directory):
    if not os.path.exists(directory):
            os.makedirs(directory)
            

make_dir("output")

for a in soup.find_all("a",href=True):
    if ".ZIP" not in a["href"].upper():
        continue
    

    index =  a["href"].rfind("/") + 1
    fname = "output/" + a["href"][index:]

    print a["href"]
#    continue
    
    print "Downloading: " + a["href"] + " => " +  fname
    
    f = requests.get(a["href"])

    if f.status_code != 200:
        print "Error"
    else:
        open(fname,'wb').write(f)

    

