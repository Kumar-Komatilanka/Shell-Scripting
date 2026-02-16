#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIRECTORY=/home/ec2-user/Shell-Scripting/app-logs
FILE_TO_DELETE=$(find $SOURCE_DIRECTORY  -name "*.log" -mtime +14)

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
echo -e "$R You must be a root user to run the script $N" | tee -a $LOG_FILE
exit 1
else
echo -e "$G you are running as a root user $N" | tee -a $LOG_FILE
fi
echo "Script started executing at $(date)" | tee -a $LOG_FILE

while IFS= read -r line
do
echo "$R deleting $line file" $N | tee -a $LOG_FILE
rm -rf $line
done <<< $FILE_TO_DELETE