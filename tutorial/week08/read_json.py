#!/usr/bin/python

import json

fDict = [
    {'Name' : 'Orange', 'Weight(lb)' : 1, 'Color' : 'Orange'},
    {'Name' : 'Banana', 'Weight(lb)' : 4, 'Color' : 'Yellow'},
    {'Name' : 'Grape', 'Weight(lb)' : 3, 'Color' : 'Purple'}
]

fJson = json.dumps(fDict)
print(fJson)

# print jason data in well-formated
fJson = json.dumps(fDict, indent=4, sort_keys=True)
print(fJson)

# saved in a file
with open('week08/fruit.json','w') as jfile:
    jfile.write(fJson)

# 
pfruit = json.loads(fJson)
print(pfruit)

# write to json file
with open('week08/fruit.json','w') as wfile:
    wfile.write()
