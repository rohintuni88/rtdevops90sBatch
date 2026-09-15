#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
{
 echo "inside if condition $USERID"
 # exit 1
} else {
    dnf install mysql -y
}
fi

if [ $? -ne 0]; then
{
    echo "Fail"
} else {
    echo "Sucess"
}
fi
