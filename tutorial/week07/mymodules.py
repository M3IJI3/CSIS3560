#!/usr/bin/python

from modules import mymodule as mm

seq = [1,2,3,20,30]

print("the total of sequence is", mm.accumulate(*seq))
