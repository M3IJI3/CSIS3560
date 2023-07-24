#!/bin/bash
#

if [ ! -z "$1" ];then value=$1
else 
	value=100
fi

number=$((10 + $value))

host=$(hostname)
user=`echo $USER`

echo "Number is ${number}"

echo "user ${user} is on host ${host} 
	running script with arg $1"
