#!/usr/bin/python

import os
import sys
import socket

def socket_connect(host,port):
	s = socket.socket()
	s.settimeout(10)
	s.connect((host,port))
	answer = s.recv(1024)
	s.settimeout(None)
	return answer

if len(sys.argv) > 1: # the script was called with an arg
	host = sys.argv[1]
else:
	# we are going to find out the hostname
	command = "hostname"
	
	# to run linux command on python
	# use os.system(command)
	# but if you expect a return value, you need to use
	# os.popen(command)
	host = os.popen(command).read().strip()

print("The host is:", host)
ports=[22, 80]

for port in ports:
	answer = socket_connect(host,port)
	print("Poking server {0} at port {1}, get answer {2}".format(host,port,answer))
