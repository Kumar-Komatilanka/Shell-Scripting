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
echo "$2 was installed successfully"
else
echo " $2 was not installed successfully"
exit 1
fi
}
dnf installed mysql
if [ $? -ne 0 ]
then
echo "Mysql is not installed.. Going to install"
dnf install mysql -y
VALIDATE $? "mysql"
else
echo "progrmme is already installed, nothing to do"
fi
if [ $? -ne 0 ]
then
echo "nginx is not installed.. Going to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed, nothing to do"
fi

