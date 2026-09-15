#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
     echo "inside if condition $USERID"
     echo "Please use Sudo user"
    exit 1
fi

#  Without Finctions, to install mysql
 dnf install mysql -y
if [ $? -eq 1 ]; then 
    echo "Already Installed"
    dnf list installed mysql
    mysql --version
else
    echo "Installing now $?"
    dnf install mysql -y
    VALIDATE mysql $?
 #    if [ $? -ne 0 ]; then
 #        echo " Installing fail $?"
 #     else 
 #        echo "Installing Sucess $?"
 #    fi
fi

 

# with Funtions

  VALIDATE(){
     if [ $2 -ne 0 ]; then
        echo "Installing fail $1"
    else 
        echo "Installing Sucess $1"
    fi
  }