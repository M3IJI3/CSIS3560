#!/bin/bash

function get-server-info(){
	HOST=`ssh sshuser@$1 2>/dev/null  uname -nrs`
	echo $HOST
}

