#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
     echo "inside if condition $USERID"
     echo "Please use Sudo user"
    exit 1
fi
 dnf install mysql -y
if [ $? -eq 0 ]; then 
    echo "Already Installed"
    dnf list installed mysql
    mysql --version
else
    echo "Installing now $?"
    dnf install mysql -y
     if [ $? -ne 0 ]; then
        echo " Installing fail $?"
    else 
        echo "Installing Sucess $?"
    fi
fi
