#!/bin/sh

# Import Variables
cd /home/magictaly/work/MasterBigData_macCounter/scripts && . ./config.sh

# Creatin directories
mkdir -p /tmp/scanning
mkdir -p /tmp/scanning/upload


echo `date +"%Y-%m-%d_%H-%M-%S"`":" >> $_logFile
echo **************************** STARTING CAPTURING ********************************* >> $_logFile

# Capturing starts

until [1]; do
 
   
iw dev fish5 del
iw dev wlan1 interface add fish5 type monitor flags none
ifconfig fish5 down
sleep 2
iwconfig fish5 mode Monitor
iwconfig fish5 mode Monitor
iwconfig fish5 mode Monitor
sleep 2
iwconfig fish5 mode Monitor
sleep 2
ifconfig fish5 up

tcpdump -tttt -i fish5 -e -s 256 -G "$sendDataInterval" -w "$_captureFile"%F-%T -z /home/magictaly/work/MasterBigData_macCounter/scripts/send-captured-data.sh type mgt subtype probe-req 2 >> $_logFile

echo `date +"%Y-%m-%d_%H-%M-%S"`":" >> $_logFile
echo **********************ERROR: RESET TCPDUMP++++++++++++++++++++++++++++++ >>$_logfile

done




