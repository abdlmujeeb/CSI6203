#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This is a script to move the folder to the respective directory as mentioned in script.
read -p "Please enter folder name:" folderName
mkdir $folderName
mv $folderName ~/CSI6203/portfolio/week2
exit 0