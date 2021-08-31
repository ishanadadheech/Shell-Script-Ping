#!/bin/bash 

echo "Please enter subnet : "
read SUBNET

FILE=checkstatus.txt
touch $FILE

for IP in {1..254..1}
do
	DATE=$(date '+%d/%m/%y  %H:%M:%S')
	TARGET=$(ping $SUBNET.$IP)
	ping -w 1 $SUBNET.$IP &> /dev/null && echo sucess $DATE || echo fail $DATE 
	echo $TARGET >> $FILE
	sleep 2
done
