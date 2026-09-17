#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=/var/log/shell
LOG_FILES="$LOG_FOLDER/$0.log"
TIME_STAMP=$(date "+%Y-%m-%d")

if [ $USERID -ne 0 ]; then
  echo "USE Sudo user"
  exit 1
fi

for pack in $@
do
  echo $TIME_STAMP "install..............................................HELLOOOOOOOOOOOOOOOOOOOOOO" $pack  &>> $LOG_FILES | tee -a $LOG_FILES
  dnf install $pack -y  &>> $LOG_FILES | tee -a $LOG_FILES
  dnf list installed $pack &>> $LOG_FILES | tee -a $LOG_FILES
  
  if [ $? -ne 0 ]; then
   dnf install $pack -y &>> $LOG_FILES
   echo " $TIME_STAMP Installed ................ $pack" | tee -a $LOG_FILES
   else
   echo "$TIME_STAMP Not Installed ..............$pack" | tee -a $LOG_FILES
   fi
done
  if [ $? -ne 0 ]; then
   echo "Sucess"
  fi

