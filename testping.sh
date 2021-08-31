#!/bin/bash

echo "Please enter subnet : "
read SUBNET

FILE=checkstatus.txt
touch $FILE

for IP in {1..254..1}
do
	DATE=$(date '+%d/%m/%Y %H:%M:%S')
	TARGET=$(ping  $SUBNET.$IP)
	ping -w 1 $SUBNET.$IP &> /dev/null && echo Success $DATE || echo Fail $DATE
	echo $TARGET >> $FILE
        sleep 2
done








