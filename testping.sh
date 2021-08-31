#!/bin/bash
#Script  to ping target after every 5 seconds and redirect stdout and std errors.

#Enter  the Subnet.
echo "Please enter subnet : "
read SUBNET

#Creating file that stores stdout logs to monitor.
FILE=checkstatus.txt
touch $FILE

#Loop to run process untill it pings all targets defined in seq .
for IP in {1..254..1}
do
	DATE=$(date '+%d/%m/%Y %H:%M:%S')                                                    #DATE variable ;stores current date and time
	TARGET=$(ping  $SUBNET.$IP)                                                          #TARGET variable;capture logs of standard output 
	ping -w 1 $SUBNET.$IP &>/dev/null && echo Success $DATE || echo Fail $DATE           #Redirecting standard output and standard error
	echo $TARGET >> $FILE                                                                #FILE stores logs that TARGET captured
        sleep 5                                                                              #Sleep 5
done

#End of script







