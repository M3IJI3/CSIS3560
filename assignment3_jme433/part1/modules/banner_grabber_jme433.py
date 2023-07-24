#!/usr/bin/python

# This python file is going to created a banner

import os

def print_banner(title, name):
    
    print_title = f'toilet -f smblock -F border --metal "{title}"'
    print_name  = f'toilet -f future "{name}"'

    output = os.popen(print_title).read() + os.popen(print_name).read()

    print(output)

