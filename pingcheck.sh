#!/bin/bash
echo "Please enter subnet"
read SUBNET

for IP in $(seq 100 254);
do
	fping -c1 -t300 $SUBNET.$IP  2>/dev/null 1> dev/null 

	if [[ $? = 0 ]]; then 
		echo "host found"
	else 
		echo "host not found"
	fi
		sleep 1
done 
