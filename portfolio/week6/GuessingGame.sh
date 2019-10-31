#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script ask the user to guess a number.
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}
#This function will get a value from 2nd and 3rd arguments
getNumber(){
    read -p "$1: "
    while(( $REPLY < $2 || $REPLY > $3 )); do
        printError "input must be between $2 and $3"
        read -p "$1: "
    return
    done
    if [ $REPLY -eq 42 ]; then
        echo "RIGHT!"
    elif [ $REPLY -lt 42 ]; then
        echo "TOO LOW!"
    else 
        echo "TOO HIGH!"
    fi
}
echo "This is the very beginning of the script"
REPLY=1
#the loop will keep on running untill the specified number matches i.e., 42
until(( $REPLY==42 )); do
getNumber "Please type the number between 1 and 100 " 1 100
done
echo "Thank You for playing the game!"
exit 0