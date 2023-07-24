#!/usr/bin/python

from modules import methods

def menu():
    # print banner
    print(methods.draw_banner("Assign 4: Part1 JSON API", "slant"))
    print(methods.draw_banner("by - Jie Mei 300364433", "smbraille"))

    while(True):
        # menu
        print("\n1. Create a json file for Douglas College weather\n" + 
              "2. Print the forecast temperature of the next 6 hours\n" +
              "3. exit the application\n")
        
        # input check
        try:
            option = int(input("Please enter your option[1-3]: ")) 

            if option in range (1, 4):
                if option == 1:
                    methods.menu_option1_handler()
                    print("The JSON file has been successfully created!\n")
                elif option == 2:
                    methods.menu_option2_handler()
                elif option == 3:
                    print("Bye bye!")
                    exit()
            else:
                print("Please enetr a number between 1 and 3.\n")
                continue

        except Exception:
            print("Please enter a valid number.\n")
  
# invoke the menu() function
if __name__ == "__main__":
    menu()
