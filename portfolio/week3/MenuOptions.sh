#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script shows the functionality of USE CASE

#Here user selects the options by entering the number
echo "Select Your Option"
echo "  1)Create a folder"
echo "  2)List files in the folder"
echo "  3)Copy a folder"
echo "  4)Save a password" 
echo "  5)Read the password" 
echo "  6)Print newest file" 

read n
case $n in
  1) echo "You chose to create a folder.";
  #If Option 1 is selected by user then it creates the folder by asking user the foldername
     read -p "Enter the folder name you would like to create: " folderName
     mkdir "$folderName"
      ;;
  2) echo "You chose to list all the files in the folder.";
  #If Option 2 is selected by user then it will list all the files present in the respective folder.
     read -p "Enter the folder name: " folderName
     cd $folderName
     ls $folderName
  ;;
  3) echo "You chose to copy a folder";
  #If Option 3 is selected then it will copy a folder.
    read -p "type the name of the folder you would like to copy: " folderName
    #if the name is a valid directory
    if [ -d "$folderName" ]; then
    #copy it to a new location
    read -p "type the name of the destination folder: " newFolderName
    cp -r "$folderName" "$newFolderName"
    else
    #otherwise, print an error
    echo "I couldn't find that folder"
    fi
  ;;
  4) echo "You chose to save a password.";
  #If Option 4 is selected then user wants to save a password in the filename provided.
    read -p "Enter the filename to save your password: " passwordFile
    read -p "Enter the Password: " yourPassword
    echo  $yourPassword > $passwordFile
  ;;
  5) echo "You chose to read the password";
  #If Option 5 is selected then user wants to display the password.
     read -p "Enter the file name " filename
    #Checks if the file exits and then prints the content.
    if [ -f "$filename" ]; then
    cat $filename
    #If file is not present then it prints the following cannot read the file.
    else 
    echo "Cannot read the file."
    fi
  ;;
  6) echo "You chose to print the newest file.";
        echo "Not done yet"
  ;;
  *) echo "invalid option";;
esac
exit 0