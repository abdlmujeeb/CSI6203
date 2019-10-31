#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script downloads a file from the web.

download_url()
{
    #Read the input from the user.
    read -p "Type the URL of file for download: " URL_File

    #Reading the input from the user for the location to save the file.
    read -p "Type the location of the file where you want to store: " loc1

    #wget command is used to download the file and save in the specified location.
    wget -P $loc1 $URL_File
    echo "The download is completed! "
}

download_url
exit 0