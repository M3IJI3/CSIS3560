#!/bin/bash
#
source inc/sys-info.inc
source inc/disk-info.inc 

menu(){
echo "
Please select
1. Display system information.
2. Display disk space/
0. Exit
"

read -p "Enter selection [0-2]"

case "${REPLY}" in 
	0)	echo "Exit. Bye"
		exit
		;;
	1)	sysinfo; menu;;
	2) 	diskinfo; menu;;
esac

}

menu
