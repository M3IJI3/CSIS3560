source_message = input("Enter the text to cipher:")

source_message = source_message.lower()

cipher_text = ""

for letter in source_message:
    ascii_num = ord(letter)

    if ascii_num >= 97 and ascii_num <= 122:
        new_ascii = ascii_num + 13

        if new_ascii > 122:
            new_ascii -= 26
            
        cipher_text = cipher_text + chr(new_ascii)
    else:
        cipher_text = cipher_text + chr(ascii_num)

print("The cipher text is:", cipher_text)