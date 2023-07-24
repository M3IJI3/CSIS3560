#!/usr/bin/python

from modules import banner_grabber_jme433 as bg

import os
import sys
import socket

bg.print_banner("Assignment 3: Banner Grabber", "BY JIE [ 300364433 ]")

def socket_connect(host, port):
    try:
        s = socket.socket()
        s.connect((host, port))
        s.settimeout(10)
        answer = s.recv(1024)
        s.close()
        return answer
    except Exception as e:
        answer = f"{e}"
        return answer

# define the function to read text file
def read_text_file(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    return content

# read the conf files defined in conf directory
# save the results
servers = read_text_file('conf/servers.conf').split()
ports = read_text_file('conf/ports.conf').replace(',','').split()

# nested for loop
for server in servers:
    print()
    for port in ports:
        
        # cast str port to int port
        port = int(port)
        
        answer = socket_connect(server, port)
        print("Host {0} port {1}\n\tAnswer is {2}".format(server, port, answer))
















