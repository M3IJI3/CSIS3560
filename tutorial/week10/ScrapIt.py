#!/usr/bin/python

import requests, bs4

url = "http://140.161.84.46:3000/laptop.html"
response = requests.get(url)
soup = bs4.BeautifulSoup(response.text, "html.parser")

models = soup.select(".model-name")

lenovo = 0
macbook = 0

for model in models:
    brand = model.getText().lower().split(" ")[0]
    if brand == 'macbook':
        macbook += 1
    else:
        lenovo += 1

print('There are ', macbook, 'number of macbook')
print('There are ', lenovo, 'number of lenovo')

