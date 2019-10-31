#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This is a simple script to display a message
read -p "type the name of the folder you would like to create: " folderName
mkdir "$folderName"
cd "$folderName"
read -p "Enter the password: " password
echo $password > secret.txt
exit