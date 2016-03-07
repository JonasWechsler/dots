#!/bin/bash
while true; do
    sleep 1
    CPU=`top -bn2 | grep \"Cpu(s)\" | awk \'{print $2 + $4}\' | sed -n 2p`
    FREE_DATA=`free -m | grep Mem`
    CURRENT=`echo $FREE_DATA | cut -f3 -d\' \'`
    TOTAL=`echo $FREE_DATA | cut -f2 -d\' \'`
    BAT=`acpi | grep -o \"[0-9][0-9]%\"`
    DATE=`date`
    echo "$CPU $FREE_DATA $CURRENT $TOTAL $DATE"
done
