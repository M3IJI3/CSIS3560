#!/bin/bash
# 
# Author: Jie Mei
# Student NO.: 300364433
# Date: May 17 2023
# Description: This bash is going to output a .html file and display
# 	       basic information gathered in the table. 
#
#
# 1.The name of machine 
HOST=`hostname`

# 2.The average 15 minutes load of machine
MACHINE_LOADING_AVG_FIFTEEN_MINS=`uptime | awk -F 'average:' '{print $2}' | awk -F ',' '{print $3}'`

# 3.The number of processes running in the machine currently
NUMBER_OF_PROCESS_RUNNING=`ps -ax | wc -l`

# 4.The number of users currently logon
ACTIVE_LOGON_USER=`who | wc -l`

# 5.The number of users in the system
SYSTEM_USER_COUNT=`cat /etc/passwd | wc -l`

# 6.The number of users cannot login
NO_LOGIN_USER_COUNT=`cat /etc/passwd | grep nologin | wc -l`

# 7.The number of sudo user
COMMA_COUNT=`cat /etc/group | grep sudo | grep -o ',' | wc -l`
SUDO_USER_COUNT=$(expr $COMMA_COUNT + 1)

# 8.The number of sudo command has been invoked
SUDO_INVOKED_COUNT=`cat /var/log/auth.log | grep sudo | wc -l`

# 9.The number of login/authentication failure
FAIL_LOGIN_COUNT=`cat /var/log/auth.log | grep failure | wc -l`

# BELOW ARE HTML CONTENTS
html_content="
<!DOCTYPE html>
<html>
  <head>
    <title>Information Table</title>
    <style>
    table { 
    	border-collapse: collapse;
	width: 100%;
    }

    th,td {
     	border: 1px solid black;
	padding: 8px;
	text-align: center;
    }

    tr:nth-child(even) {
    	background-color: #f2f2f2; 
    }
    </style>
  </head>
  <body>
    <table>
      <thead>
        <tr>
	  <th>Host Name</th>
	  <th>Average Loaded Machine(15 mins)</th>
	  <th>Process Number(Real time)</th>
	  <th>Active User(Real time)</th>
	  <th>System User Amount</th>
	  <th>User Cannot Login Amount</th>
	  <th>Sudo User Amount</th>
	  <th>Sudo Invoked Times</th>
	  <th>Login Authentication Failure Times</th>
	</tr>
      </thead>
      <tbody>
        <tr>
	  <td>$HOST</td>
	  <td>$MACHINE_LOADING_AVG_FIFTEEN_MINS</td>
	  <td>$NUMBER_OF_PROCESS_RUNNING</td>
	  <td>$ACTIVE_LOGON_USER</td>
	  <td>$SYSTEM_USER_COUNT</td>
	  <td>$NO_LOGIN_USER_COUNT</td>
	  <td>$SUDO_USER_COUNT</td>
	  <td>$SUDO_INVOKED_COUNT</td>
	  <td>$FAIL_LOGIN_COUNT</td>
	</tr>
      </tbody>
    </table>
  </body>
</html>
"

# Save the file
echo "$html_content" > output_part2_jme433.html

# Print successful promption
echo "HTML file generated successfully!"


