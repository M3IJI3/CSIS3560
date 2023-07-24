#!/usr/bin/python

number = int(input("Enter a number: "))

if number > 0:
	if number % 2 == 0:
		print("This is an even number.")
	else: print("This is an odd number.")
	
elif number == 0:
	print("This is zero.")
	
else: print("This is negative.")

if number > 0 and number < 10:
	print("Number is between zero and ten.")
elif 0<number<20:
	print("Number is between zero and twenty.")
elif number<=0:
	print("Number is less than or equal to zero.")
else: print("Number is greater than twenty.")

# use range() function, for example, (0, 10) is 0 <= number < 10
if number in range(0,10):
	print("Yes")
