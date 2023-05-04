#!/bin/bash

mysql --user=mygest --password=btsinfo -e "SELECT adIP FROM MyGest.Equipement;"  > ip.txt

for line in $(cat ip.txt)
do
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

ping=$(ping -w 3 $line | grep -oP '\d+(?=% packet loss)')

if  [[ "$ping" == "0" ]]; 
    then
        echo "${GREEN}$line"
    else
        echo "${RED}$line"
fi
tput setaf 15
done