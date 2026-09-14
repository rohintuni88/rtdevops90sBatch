#!/bin/bash
echo "Hello World"
PERSON1=Ram
PERSON2=Sita
TIMESTAMP=$(date)
echo Hello $PERSON1
echo Hi $PERSON2
echo "Current date and time: $TIMESTAMP  $@ $# $1 $2 $3 $0"