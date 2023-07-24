#!/usr/bin/python
from clint.textui import colored
from colorama import Fore,Back,Style
from pyfiglet import Figlet

def welcome(text):
    result = Figlet()
    return colored.green(result.renderText(text))