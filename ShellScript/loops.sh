#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=var/log/shell
LOG_FILES="$LOG_FOLDER/$0.log"

if [ $USERID -ne 0 ]; then
  echo "USE Sudo user"
  exit 1
fi

for pack in $@
do
  echo insall $pack
  dnf install $pack -y  &>> $LOG_FILES
  dnf list installed $pack &>> $LOG_FILES
  
  if [ $? -ne 0 ]; then
   dnf install $pack -y &>> $LOG_FILES
   echo "Installed ................ $pack"
   else
   echo "Not Installed ..............$pack"
   fi
done
  if [ $? -ne 0 ]; then
   echo "Sucess"
  fi

