#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3 :- 14}  #If we pass days in command it will take that otherwise it will take default 14 days
LOGS_FOLDER="/var/log/shell-scripting
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
FILE_NAME="$LOGS_FOLDER/$SCRIPT_NAME"

check_root(){
if [ $USERID -ne 0 ]
then
echo "$R You must be root user to run the script $N"
exit1
else
echo "$G you are running as root user"
fi
}
VALIDATE(){
if [ $1 -eq 0 ]
then
echo -e "$G $2 is success"
else
echo -e "$R $2 is failure"
exit1
fi
}

check_root
mkdir -p $LOGS_FOLDER
USAGE(){
echo " sudo sh 17-backup.sh <source directory> <destination directory> <Days(optional)>"
exit1
}

if [ $# -lt 0 ]
then
USAGE
fi

if [ ! -d $SOURCE_DIR ] 
then
echo " Source directory $SOURCE_DIR does not exists"
exit1
fi

if [ ! -d $DEST_DIR ] 
then
echo " Destination directory $DEST_DIR does not exists"
exit1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)

if [ ! z "$FILES"]
then
echo "Files are zipping $FILES"
TIMESTAMP=$(date +%F-%H-%M-%S)
ZIP_FILES=$DEST_DIR/app-logs-$TIMESTAMP.log
find $SOURCE_DIR -name "*.log" -mtime $DAYS | zip -@ "$ZIP_FILES"
if [ -f $ZIP_FILE ]
then
echo "Zip files created successfully"
while IFS= read -r filepath
        do
            echo "Deleting file: $filepath" | tee -a $LOG_FILE
            rm -rf $filepath
        done <<< $FILES
    echo -e "Log files older than $DAYS from source directory removed ... $G SUCCESS $N"    
else
echo " -e "Zip file creation ... $R FAILURE $N"
exit1
fi
esle
echo "Files older that $DAYS are not found"
fi
