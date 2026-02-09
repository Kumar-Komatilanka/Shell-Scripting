#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#Defining logs files to save the output
LOGS_FOLDER="/var/log/shellscripting-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #We are cutting .sh from the script name(14-logs.sh)
LOG_File=$LOGS_FOLDER/$SCRIPT_NAME.log
#create shellscripting.log file
mkdir -p $LOGS_FOLDER
echo "your script is running at $(date)" | tee -a $LOG_File
#Defining script to know whether user is a root user or not
if [ $USERID -ne 0 ]
then
echo -e " $R Error: $N You should be root user to install programme" | tee -a $LOG_File
else
echo -e " $G you are running as root user" | tee -a $LOG_File
fi
#Defining function to check whether programme was installed successfully or not
VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e " $G $2 was installed successfully" | tee -a $LOG_File
    else
    echo -e "$R $2 was not installed successfully" | tee -a $LOG_File
    exit 1
    fi
}

#Now writing a script to check if programme was already instlled or not and then install it
dnf list installed mysql &>>$LOG_File
if [ $? -ne 0 ]
then
echo -e "mysql is not installed going to install" | tee -a $LOG_File
dnf install mysql -y | tee -a $LOG_File
VALIDATE $? "mysql"
else
echo -e "$G mysql is already installed" | tee -a $LOG_File
fi
#Same logic to install nginx
dnf list installed nginx &>>$LOG_File
if [ $? -ne 0 ]
then
echo -e "nginx is not installed going to install" | tee -a $LOG_File
dnf install nginx -y | tee -a $LOG_File
VALIDATE $? "nginx"
else
echo -e "$G nginx is already installed" | tee -a $LOG_File
fi