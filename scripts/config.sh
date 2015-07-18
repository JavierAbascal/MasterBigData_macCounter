#!/bin/sh

# Working Variables
export RasbperryPi2_ID="000001"

export restWebService=http://52.18.1.37:8080/RouterREST/rest/file/upload
export webservice_token=c512623ef8144b3862f19739ccc9fd03

export sendDataInterval=10  # In Seconds
export captureDebugMode=0

# Path & Routes variables
export _baseDir=/home/magictaly/work/scanning/
export _dumpFileName=dump_
export _logFile=${_baseDir}log
export _captureFile=$_baseDir$_dumpFileName
export _uploadPath=upload/
export _uploadDir=$_baseDir$_uploadPath
