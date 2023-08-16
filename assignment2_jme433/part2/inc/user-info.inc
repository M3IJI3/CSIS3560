#!/bin/bash
# user-info.inc

function whoami(){
	USERNAME=$(ssh testuser@$1 2>/dev/null "whoami")
	echo $USERNAME
}

function user-num(){
	USER_NUM=$(ssh testuser@$1 2>/dev/null "cut -d ':' -f 1 /etc/passwd | wc -l")
	echo $USER_NUM
}

function grp-num(){
	GROUP_NUM=$(ssh testuser@$1 2>/dev/null "cut -d ':' -f 1 /etc/group | wc -l")
	echo $GROUP_NUM
}

function user-with-home(){
	USER_WITH_HOME=$(ssh testuser@$1 2>/dev/null "grep -c '/home' /etc/passwd")
	echo $USER_WITH_HOME
}
