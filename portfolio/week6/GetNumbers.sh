#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This scripts verifies the input from the user with the specified range in the code.

#This function displays error if wrong input is given.
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}
#This function verifies the numbers which are entered by the users.
get_number(){
    read -p "$1: "
    while(( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1: "
    done
}

echo "This is the start of the script"
get_number "Pleae type the number between 1 and 10" 1 10
echo "Thank You!"
get_number "Please type a number between 50 and 100" 50 100
echo "Thank You!"