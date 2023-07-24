#!/usr/bin/python

seq = [1,2,3,4,5,6,10] # this is a list

print("The sequence is:", *seq, sep=" ")

total=0
for x in seq:
    total += x

print("The total is:", total)

# example of break and range()
total = 0
for x in range(len(seq)):
	if seq[x]==0:
		break
	total += seq[x]

print("The total is:", total)

# example of enumerate() and continue
total=0
for i,x in enumerate(seq):
	if i == 3:
		continue
	total += seq[i] 
print("Total is:", total)

#more example of enumerate()
for i,x in enumerate(["tic","tac","toe"]):
	print(i,x)

greet = ["Hello","How's"]
topic = ["Major", "your day?"]

for g,t in zip(greet, topic):
	print("{0} {1}".format(g,t))







