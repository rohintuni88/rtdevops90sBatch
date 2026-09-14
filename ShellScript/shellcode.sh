#!/bin/bash
echo "Hello World"
PERSON1=Ram
PERSON2=Sita
TIMESTAMP=$(date)
echo Hello $PERSON1
echo Hi $PERSON2
echo "Current date and time: $TIMESTAMP"
echo "Script arguments: $@, Argument count: $#"
echo "First argument: $1, Second argument: $2, Third argument: $3"
echo "Script name: $0"
echo "Current user: $USER"
echo "Home directory: $HOME"
echo "Current working directory: $PWD"

NUM1=20
NUM2=40
SUM=$((NUM1 + NUM2))
echo "Sum of $NUM1 and $NUM2 is: $SUM"

 MOVIES=("RRR", "DDD", "KGF", "PUSHPA")
 echo "display ${MOVIES[@]}"
 echo "display ${MOVIES[0]}"
 echo "display ${MOVIES[1]}"
 echo "display ${MOVIES[2]}"
 echo "display ${MOVIES[3]}"
 echo $?
 echo $$