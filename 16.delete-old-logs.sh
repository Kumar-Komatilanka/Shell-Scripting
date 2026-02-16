#!/bin/bash
SOURCE_DIRECTORY=/home/ec2-user/Shell-Scripting/app-logs
FILE_TO_DELETE=$(find $SOURCE_DIRECTORY  -name "*.log" -mtime +14)

while IFS= read -r line
do
rm -rf $line
done <<< $FILE_TO_DELETE