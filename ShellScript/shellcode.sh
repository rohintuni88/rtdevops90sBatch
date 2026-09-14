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