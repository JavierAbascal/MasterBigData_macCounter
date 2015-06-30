#!/bin/sh

# Working Variables
export RasbperryPi2_ID="000001"

export restWebservice=http://192.168.0.103:8080/RESTWebservice/rest/file/upload
export webservice_token=c512623ef8144b3862f19739ccc9fd03

export sendDataInterval=10  # In Seconds
export captureDebugMode=0

# Path & Routes variables
export _baseDir=/tmp/scanning/
export _dumpFileName=dump_
export _logFile=${_baseDir}log
export _captureFile=$_baseDir$_dumpFileName
export _uploadPath=upload/
export _uploadDir=$_baseDir$_uploadPath
