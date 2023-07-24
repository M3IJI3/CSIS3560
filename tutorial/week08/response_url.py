#!/usr/bin/python

import json, requests

url = "http://140.161.84.57:3560/data/week08.json"
response = requests.get(url)
response.raise_for_status()

with open('result.json','wb') as jfile:
    jfile.write(response)




