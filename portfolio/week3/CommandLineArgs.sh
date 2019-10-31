#!/bin/bash
if (( "$#" == 3)); then
    if [ -f "$1" ]; then
    echo "Yes $1 is a File "
    else 
    echo "$1 This is not a file"
    fi
    if [ -f "$2" ]; then
    echo "Yes $2 is a File "
    else 
    echo "$2 This is not a file"
    fi    
    if [ -f "$3" ]; then
    echo "Yes $3 is a File "
    else 
    echo "$3 This is not a file"
    fi
else
echo "$#"
exit 1
fi
