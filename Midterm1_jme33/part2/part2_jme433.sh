#!/bin/bash
#

read -p "Please enter your student ID: " student_id

index=4


encrypted_msg=$(ssh midtermuser@remote3560 "cat secret/kvok.kok | awk 'NR==$index'")
real_msg=$(ssh midtermuser@remote3560 "cat secret/kvok.kok | awk 'NR==$index' | tr r-za-q a-z")


echo "The secret message is "
echo "$encrypted_msg"
echo "The recovered message is "
echo "$real_msg"

