#!/usr/bin/python

import nmap
import shelve

def main():
    # print header
    print("--------------------------------------\n" + 
          "  CSIS 3560 Midterm 2: Python\n" + 
          "  Part1: Shelve, Port scanner and CSV\n" + 
          "  Name: Jie (300364433)\n" + 
          "--------------------------------------\n")
    
    file_path = "part1/conf/config.db"
    with shelve.open(file_path, 'c') as db:
        db["servers"] = "servers"
        db["ports"] = "ports"
    
    

if __name__ == "__main__":
    main()