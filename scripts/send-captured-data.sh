#!/bin/sh

# Import Variables
cd /home/magictaly/work/MasterBigData_macCounter/scripts && . ./config.sh

# Config file names
fileDate=`date +"%Y-%m-%d_%H-%M-%S"`

extension=".log"
prepend="probe_"
separator="_"

backedCaptureFileName=$_uploadDir$prepend$fileDate$separator$RasbperryPi2_ID$extension
mkdir -p "$_uploadDir"


if [ $# -eq 1 ] ; then
  echo `date +"%Y-%m-%d_%H-%M-%S"`": Generating text dupm on $1 ..." >> $_logFile
  tcpdump -tttt -e -r $1 | awk -f /home/magictaly/work/MasterBigData_macCounter/scripts/FilterData  -v id="$RasbperryPi2_ID" -v debug="$captureDebugMode"> $backedCaptureFileName
  rm $1
fi

# Compress capture files
cd $_uploadDir
for f in probe_*.log ; do
  if [ -f "$f" ] ; then
    echo `date +"%Y-%m-%d_%H-%M-%S"`": Compressing $f ..." >> $_logFile
    gzip $f
  fi
done

# Upload compressed files to server and deletes uploaded files
for f in ${_uploadDir}*.gz ; do
  if [ -f "$f" ] ; then
    echo `date +"%Y-%m-%d_%H-%M-%S"`": Moving $f to server..." >> $_logFile
    #Webservice Java "Produccion"
    curl -F "file=@$f" ${restWebService}?token=${webservice_token} && rm "$f"
  fi
done

