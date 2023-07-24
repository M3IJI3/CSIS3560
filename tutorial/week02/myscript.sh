#!/bin/bash
#
# script to ping a host

echo "welcome to my script"

echo "Enter your name"

read name

echo "Enter the target IP address"

read ip

host=`hostname`

echo 

echo "User $name From host $host will ping ip $ip"

ping -c 5 $ip


