#!/usr/bin/python

import webbrowser as web
import sys

if len(sys.argv) > 1:
    address = "".join(sys.argv[1:])

#url = "http://www.douglascollege.ca"

url = "https://www.google.com/maps/search/" + address.replace(" ", "+")
web.open(url)

