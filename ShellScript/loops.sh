#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=var/log/shell
LOG_FILES="$LOG_FOLDER/$0.log"

if [$USERID -ne 0]; then
  echo "USE Sudo user"
  exit 1
fi

for pack in $@
do
  echo insall $pack
  dnf install $pack -y
  dnf list installed $pack
  if [ $? -ne 0 ]; then
   dnf install $pack -y
   echo "Installed .... $pack"
   else
   echo "Not Installed $pack"
done

