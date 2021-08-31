#!/bin/bash
#bash script which pings target every 5 seconds and logs output to a file.

#Taking IP as input
echo "Please enter IP: "
read IP

#Variable to store  IP  input
TARGET=$IP

#Creating file to monitor output
FILE=status.txt
touch $FILE

#Condition check
while true;
do
	DATE=$(date '+%d/%m/%Y %H:%M:%S')
        ping -w 10 $TARGET >>$FILE
            if [[ $? -ne 0 ]]; then
              echo "ERROR "$DATE
            else
              echo "OK "$DATE
            fi
              sleep 5
done
