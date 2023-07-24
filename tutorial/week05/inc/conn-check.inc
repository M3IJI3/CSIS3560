#!/bin/bash

function check-conn(){
	AVG=`ping $1 -c 3 2>/dev/null | grep avg | cut -d '/' -f 5`
	echo "$AVG"
}

#check-conn $1
