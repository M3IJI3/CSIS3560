#!/usr/bin/python

import os

from modules import caesar_cipher_jme33 as cc

# generate banner
def banner_generator(text, font):
    banner = f'figlet -f {font} {text}'
    output = os.popen(banner).read()
    return output

# define the menu
def menu():

    while True:
        option = input("Do you want to 1) Encrypt or 2) Decrypt? ")
        if option.isnumeric():
            if eval(option) in range (1, 3):
                break
        else:
            continue
    
    while True:
        rotation = input("Enter the number of shifting to cipher [between 1 to 26]: ")
        if rotation.isnumeric():
            if eval(rotation) in range (1, 27):
                break
        else:
            print("Please enter an integer number between the range")
            continue
    
    while True:
        if eval(option) == 1:
            path = input("Enter the filename to encrypt: ")
            
        if eval(option) == 2:
            path = input("Enter the filename to decrypt: ")
        
        
        message = read_file(path)
        if message is None:
            continue
        else:
            print("\nOriginal message is: \n{0}".format(message))
            break
    
    return option, rotation, message
     
# define a function to read file    
def read_file(path):
    try:
        # open file
        file = open(path,"r")
        # read file content 
        content = file.read()
        # close stream
        file.close()
        # return the result if file exists
        return content

    # throw the exception if the file doesn't exist
    except FileNotFoundError:
        print("File doesn't exist!")

# print banner
print(banner_generator("Assign 3: Part2 Caesar Cipher", "slant"))
print(banner_generator("by - Jie 300364433", "smbraille")) 


# invoke menu function and get inputs for variables
option, rotation, message = menu()

# invoke cipher function 
processed_msg = cc.cipher(message, eval(rotation), eval(option))

if eval(option) == 1:
    print("Encrypted message is:\n{0}".format(processed_msg))

if eval(option) == 2:
    print("Decrypted message is:\n{0}".format(processed_msg))

# save encrypted message to file output_part2_jme433.txt
command = f'echo "{processed_msg}" > output_part2_jme433.txt'
os.popen(command).read()
print("Output is saved as output_part2_jme433.txt file")

        

