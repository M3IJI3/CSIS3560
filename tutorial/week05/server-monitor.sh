#!/bin/bash
#
source inc/conn-check.inc
source inc/server-info.inc

SERVER_LIST="conf/server.txt"

readarray -t SERVERS < $SERVER_LIST

for server in ${SERVERS[@]}; do
	AVG_RTT=$(check-conn $server)
	HOST_INFO=$(get-server-info $server)
	HOST_NAME=`echo $HOST_INFO | cut -d ' ' -f 2`
	HOST_OS=`echo $HOST_INFO | cut -d ' ' -f 1,3`
	echo "Server $server"

	echo -e "\tHOSTNAME $HOST_NAME"
	echo -e "\tOS $HOST_OS"
	echo -e "\tavg RTT $AVG_RTT"
done
