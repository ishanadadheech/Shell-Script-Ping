#!/bin/bash

echo "Please enter IP: "
read IP

FILE=status.txt
TARGET=$IP

touch $FILE
while true;
do
	DATE=$(date '+%d/%m/%Y %H:%M:%S')
        ping -w 1 $TARGET &> /dev/null
            if [[ $? -ne 0 ]]; then
              echo "ERROR "$DATE
              echo $DATE >> $FILE
            else
              echo "OK "$DATE
            fi
              sleep 5
done
