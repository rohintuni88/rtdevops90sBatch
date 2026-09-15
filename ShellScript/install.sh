#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
{
 echo "inside if condition $USERID"
 # exit 1
} else {
    echo "fail"
}
fi

if [ $? -ne 0 ]; then
{
    dnf install mysql -y
    echo "Sucess"
} else {
    echo "fail"
}
fi
