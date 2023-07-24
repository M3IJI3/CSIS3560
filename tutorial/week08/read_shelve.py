#!/usr/bin/python

import shelve

fruit = ['apple', 'kiwi', 'banana']

with shelve.open('fruit','c') as db:
    db['fruit'] = fruit
