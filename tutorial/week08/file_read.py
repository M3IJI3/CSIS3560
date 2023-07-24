#!/usr/bin/python

data = ["hello", "csis 3560\n", "student"]

file = open('week08/message.txt', 'w')
file.write("hello world!")
file.writelines((data))
file.close()
print()

file = open('week08/message.txt', 'r')
print(file.read())
file.close()

try:
    file = open('week08/message.txt', 'r')
    print(file.readlines())
except Exception as e:
    print(e)
finally:
    if file: file.close()


with open('message.txt', 'r') as file:
    print(file.read())

