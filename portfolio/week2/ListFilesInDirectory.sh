#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This is a script to list the files in a directory
echo 'This will list the files in directory'
read -p "Enter the folder name: " folderName
cd $folderName
ls $folderName
exit 0