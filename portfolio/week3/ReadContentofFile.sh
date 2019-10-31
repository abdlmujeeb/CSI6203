#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script get the user to enter the file name and prints the content of it.
read -p "Enter the file name " filename
#Checks if the file exits and then prints the content.
if [ -f "$filename" ]; then
cat $filename
#If file is not present then it prints the following cannot read the file.
else 
echo "Cannot read the file."
fi
exit