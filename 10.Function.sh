#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " You must be a root user to install the programme"
exit 1
else 
echo "You are running as a root user"
fi
VALIDATE(){
if [ &1 -eq 0 ]
then
echo "Installing $2 was success"
else
echo "Installing $2 was failure"
exit 1
fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
echo "Mysql is not installed.. Going to install"
dnf install mysql -y
VALIDATE $? "mysql"
else
echo "progrmme is already installed, nothing to do"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
echo "nginx is not installed.. Going to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed, nothing to do"
fi

