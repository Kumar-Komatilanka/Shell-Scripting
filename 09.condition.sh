#!/bin/bash
dnf list installed mysql
if [ $? -eq 0 ]
then
echo " My sql is already installed"
else
userid=$(id -u)

if [ $userid -ne 0 ]
    then
        echo "you must login as root user to run the script"
        exit 1
    else
        echo "You are running as root user"
fi
dnf install mysql -y
if [ $? -eq 0 ]
then
echo "Mysql was installed successfully"
else
echo "Mysql was not installed successfully"
exit 1
fi
fi