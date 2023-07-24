#!/bin/bash
#

readarray -t CARS < $1

for car in ${CARS[@]}
do
	echo "Car is ${car}"
done

snack=("pancake" "donut")

for meal in ${snack[*]}
do
	echo "Meal is ${meal}"
done

