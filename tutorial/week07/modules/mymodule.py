#!/usr/bin/python

def accumulate(*args): # argument is variable length argument
	total = 0
	for x in args:
		total += x
	return total
