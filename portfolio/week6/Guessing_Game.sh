#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script is used to guess the correct number from the user which is 42.

#This function will print errors.
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}
#This functions takes the values from the command line arguments.
get_number(){
    read -p "$1: "
    while(( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
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
echo "The script begins here."
REPLY=1
#This is a recursive loop until the correct answer is matched the loop keeps running.
until(( $REPLY==42 )); do
get_number "Please type the number between 1 and 100 " 1 100
done
echo "Thank You for playing the game!"
exit 0