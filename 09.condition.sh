#!/bin/bash
dnf list installed nginx
if [ $? -eq 0 ]
then
echo " My nginx is already installed"
else
userid=$(id -u)

if [ $userid -ne 0 ]
    then
        echo "you must login as root user to run the script"
        exit 1
    else
        echo "You are running as root user"
fi
dnf install nginx -y
if [ $? -eq 0 ]
then
echo "nginx was installed successfully"
else
echo "nginx was not installed successfully"
exit 1
fi
fi