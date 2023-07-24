#!/bin/bash
#

source inc/server-info.inc
source inc/user-info.inc

SERVER_LIST="conf/servers.txt"

readarray -t SERVERS < $SERVER_LIST

for server in ${SERVERS[@]}; do
	HOST_INFO=$(get-server-info $server)
	RUNNING_SERVER_NUM=$(running-server-num $server)
	RUNNING_PS_NUM=$(running-process-num $server)
	NOT_SWAPPED_FREE_MEM=$(not-swapped-free-mem $server)
	LOAD_AVG_SERVER=$(load-avg-server $server)

	USER_NUM=$(user-num $server)
	GROUP_NUM=$(grp-num $server)
	USER_WITH_HOME=$(user-with-home $server)
	

	echo "Server $server"
	echo -e "\tHOSTNAME: $HOST_INFO"
	echo -e "\tNumber of service running: $RUNNING_SERVER_NUM"
	echo -e "\tNumber of process running: $RUNNING_PS_NUM"
	echo -e "\tFree memory(NOT SWAPPED): $NOT_SWAPPED_FREE_MEM"
	echo -e "\tLoad average server: $LOAD_AVG_SERVER"
	echo "User $(whoami $server)"
	echo -e "\tNumber of user: $USER_NUM"
	echo -e "\tNumber of group: $GROUP_NUM"
	echo -e "\tUser with home directory: $USER_WITH_HOME"
	echo
done
