#!/bin/bash

echo "Please enter subnet : "
read SUBNET

FILE=data.txt
touch $FILE

for IP in {1..254..1}
do
	DATE=$(date '+%d/%m/%Y %H:%M:%S')
	TARGET=$(ping -w 2 $SUBNET.$IP)
	ping -w 2 $SUBNET.$IP &> /dev/null 
	    if [[ $? -ne 0 ]]; then
	      echo "ERROR" $DATE
	    else 
	      echo "Successfull" $DATE
	      echo $TARGET >> $FILE
	    fi
              sleep 2
done

