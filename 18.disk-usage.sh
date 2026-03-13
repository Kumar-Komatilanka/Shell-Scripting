#!/bin/bash
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESOLD=1 #in project it will be 75

while IFS= read line
do 
USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
PARTITION=$(echo $line | awk '{print $7}')
echo "$PARTITION $USAGE"
done <<< $DISK_USAGE
