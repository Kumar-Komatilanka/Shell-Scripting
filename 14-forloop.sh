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
#Defining list of packages that we need to install in form of array
PACKAGES=("mysql" "nginx" "httpd")
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
for package in ${PACKAGES[@]}
do
dnf list installed $package &>>$LOG_File
if [ $? -ne 0 ]
then
echo -e "$package is not installed going to install" | tee -a $LOG_File
dnf install $package -y | tee -a $LOG_File
VALIDATE $? "$package"
else
echo -e "$G $package is already installed" | tee -a $LOG_File
fi
done