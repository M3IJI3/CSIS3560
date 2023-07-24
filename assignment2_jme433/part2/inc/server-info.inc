#!/bin/bash

function get-server-info(){
	HOST=`ssh testuser@$1 2>/dev/null uname -nrs`
	echo $HOST
}

function running-server-num(){
	SERVER_NUM=$(ssh testuser@$1 2>/dev/null "systemctl --type=service --state=running | wc -l")
	echo $SERVER_NUM
}

function running-process-num(){
	PS_NUM=$(ssh testuser@$1 2>/dev/null "ps aux | wc -l")
	echo $PS_NUM
}

function not-swapped-free-mem(){
	NOT_SWAPPED_FREE_MEM=$(ssh testuser@$1 2>/dev/null "free -h | awk 'NR==2 {print \$4}'")
	echo $NOT_SWAPPED_FREE_MEM
}

function load-avg-server(){
	AVG=$(ssh testuser@$1 2>/dev/null "uptime | cut -d ',' -f 5")
	echo $AVG
}

