#!/bin/bash
#Initial script to fetch partition and usage
# DISK_USAGE=$(df -hT | grep -v Filesystem)
# DISK_THRESOLD=1 #in project it will be 75

# while IFS= read line
# do 
# USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
# PARTITION=$(echo $line | awk '{print $7}')
# echo "$PARTITION $USAGE"
# done <<< $DISK_USAGE

###################################3
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESOLD=1 #in project it will be 75

while IFS= read line
do 
USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
PARTITION=$(echo $line | awk '{print $7}')
if [ $USAGE -ge $DISK_THRESOLD ]
then
#MSG="High disk usage on $PARTITION: $USAGE"  #this will replace the previous message with new one. In order to append we need to add MSG+
MSG+="High disk usage on $PARTITION: $USAGE \n" 
fi
done <<< $DISK_USAGE
echo  $MSG