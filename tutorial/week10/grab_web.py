#!/usr/bin/python

import requests, bs4

url = "http://140.161.84.46:3000/laptop.html"
response = requests.get(url)
print(response.text)

soup = bs4.BeautifulSoup(response.text, "html.parser")
models = soup.select(".model-name")
models[0].getText

