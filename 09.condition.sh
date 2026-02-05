#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
    then
        echo "you must login as root user to run the script"
    else
        echo "You are running as root user"
fi
dnf install mysql -y