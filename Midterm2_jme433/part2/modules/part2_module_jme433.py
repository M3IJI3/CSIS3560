#!/usr/bin/python

from clint.textui import colored
import os
import random
import json

def menu():
    print("--------------------------------------\n" + 
          "  CSIS 3560 Midterm 2: Python\n" + 
          "  Part2: Menu, Random things\n" + 
          "  Name: Jie (300364433)\n" + 
          "--------------------------------------\n")
    
    while(True):
        name = input("Please enter your name: ")
        if name == '':
            continue
        else:
            break

    choice = ''

    while(True):
    
        print(colored.blue("Options: \n" + 
              "1. Display random fortune\n" + 
              "2. Display random quotes\n" + 
              "3. Exit\n" + 
              "Please enter your choice[1-3]\n"))
        
        try:
            choice = int(input('Please enter your choice: '))
        except:
            print("Wrong input, please enter a number")
            print("------------------------------------------------")

            
        if choice in range(1,4):
            if choice == 1:
                print("Hi " + name)
                print(colored.yellow(get_fortune()))
            elif choice == 2:
                print("Hi " + name)
                print(colored.green(get_quote()))
            elif choice == 3:
                print("Thank you. Goodbye")
                exit()
        else:
            print("Wrong input, please enter number 1 to 3")
            print("------------------------------------------------")
                


def get_fortune():
    command = f'fortune'
    result = os.popen(command).read()
    return result

def get_quote():
    num = random.randint(1,25)
    file_path = 'part2/data/ciphered_quotes.json'
    content = open(file_path)

    cipher_dict = json.load(content)

    result = cipher_dict[str(num)]

    return cipher(result, num)
    

# decipher function
def cipher(message, rotation):
    message = message.lower()
    processed_msg = ""

    for letter in message:
        ascii_num = ord(letter)
        if ascii_num >= 97 and ascii_num <= 122:
            new_ascii = ascii_num - rotation
            if new_ascii < 97:
                new_ascii += 26
            processed_msg = processed_msg + chr(new_ascii)
        else:
            processed_msg = processed_msg + chr(ascii_num)
        
    return processed_msg

menu()