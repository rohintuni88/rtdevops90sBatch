#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
{
 echo "inside if condition $USERID"
exit 1
} else {
    echo "fail"
}
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
{ 
    echo "Sucess $?"
} else {
    dnf install mysql -y
    echo "fail"
    echo "Sucess $?"
}
fi
