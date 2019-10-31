#!/bin/bash

#This function gives and error in color.
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}
#This function reads the command line arguments.
getNumber(){
    read -p "$1: "
    while(( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1: "
    done
}

echo "This is the start of the script"
getNumber "Pleae type the number between 1 and 10" 1 10
echo "Thank You!"
getNumber "Please type a number between 50 and 100" 50 100
echo "Thank You!"