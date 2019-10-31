#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script downloads the file from the web.

#This will download the webpage and save it in a specified location.
download_url()
{
    #Reading input from the user to download the file.
    read -p "Type the URL of file for download " link

    #Reading input from the user to save the file in specified location
    read -p "Type the location of the file where you want to store " location

    #wget downloads the file and saves it in specified location.
    wget -P $location $link
    echo "The download is completed! "
}

#Function call to download the webpage.
download_url
exit 0