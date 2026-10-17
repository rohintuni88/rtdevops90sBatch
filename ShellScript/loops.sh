#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=/var/log/shell
LOG_FILES="$LOG_FOLDER/$0.log"
TIME_STAMP=$(date "+%Y-%m-%d")
R="\e[31m"

if [ $USERID -ne 0 ]; then
  echo "USE Sudo user"
  exit 1
fi

for pack in $@
do
  echo -e $TIME_STAMP "$R install..............................................HELLOOOOOOOOOOOOOOOOOOOOOO" $pack  &>> $LOG_FILES | tee -a $LOG_FILES
  dnf install $pack -y  &>> $R $LOG_FILES | tee -a $LOG_FILES
  dnf list installed $pack &>> $LOG_FILES | tee -a $LOG_FILES
  
  if [ $? -ne 0 ]; then
   dnf install $pack -y &>> $LOG_FILES
   echo -e "$R $TIME_STAMP Installed ................ $pack" | tee -a $LOG_FILES
   else
   echo -e "$R $TIME_STAMP Not Installed ..............$pack" | tee -a $LOG_FILES
   fi
done
  if [ $? -ne 0 ]; then
   echo -e "$R Sucess"
  fi

  set -e
  echo "bellow error"
  sdfasdfsdfgfdg
  echo "finish"
  trap 'echo "error at $LINENO", command: $BASH_COMMAND"' ERR