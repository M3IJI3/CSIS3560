#/usr/bin/python

# define rot13 cipher
def cipher(message, rotation, option):
    message = message.lower()
    processed_msg = ""

    for letter in message:

        # convert the letters in message to corresponding ascii number
        ascii_num = ord(letter)

        # check if a letter (a-z) character
        # if not, skip
        if ascii_num >= 97 and ascii_num <= 122:

            if option == 1:
                # Add rotation to ascii_num to shift it by "rotation"
                new_ascii = ascii_num + rotation
                # confirm new character will be alphabetic
                if new_ascii > 122:
                    # if not, wrap around
                    new_ascii -= 26
                processed_msg = processed_msg + chr(new_ascii)
            
            if option == 2:
                # Minus rotation to ascii_num to shift it by "rotation"
                new_ascii = ascii_num - rotation
                # confirm new character will be alphabetic
                if new_ascii < 97:
                    # if not, wrap around
                    new_ascii += 26
                processed_msg = processed_msg + chr(new_ascii)
        else:
            processed_msg = processed_msg + chr(ascii_num)
   
    return processed_msg


    


