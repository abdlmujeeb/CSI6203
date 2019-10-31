#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script checks if the lines read from the filename is a directory,File etc.
for phrase in $(cat filenames.txt);
do
# -d is used to check if the line in the filenames.txt is a directory
if [ -d $phrase ]; then
echo "$phrase That’s a directory" 
# -f is used to check if the line in the filenames.txt is a file
elif [ -f $phrase ]; then
echo "$phrase That file exists"
else 
echo "$phrase I don’t know what that is!"
fi
done
exit
