#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#Defining script to know whether user is a root user or not
if [ $USERID -ne 0 ]
then
echo " $R Error: $N You should be root user to install programme"
else
echo " $G you are running as root user"
fi
#Defining function to check whether programme was installed successfully or not
VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo " $G $2 was installed successfully"
    else
    echo "$R $2 was not installed successfully"
    exit 1
    fi
}

#Now writing a script to check if programme was already instlled or not and then install it
dnf list installed mysql
if [ $? -ne 0 ]
then
echo " mysql is not installed going to install"
dnf install mysql -y
VALIDATE $? "mysql"
else
echo "$G mysql is already installed"
fi
#Same logic to install nginx
dnf list installed nginx
if [ $? -ne 0 ]
then
echo " nginx is not installed going to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "$G nginx is already installed"
fi






