#!/bin/bash

#Downloading the web page and saving to a speccific directory
download_url()
{
    #Reading input from the user for the file to download.
    read -p "Type the URL of file for download " URL_File

    #directing the user to mention the location of the file
    read -p "Type the location of the file where you want to store " loc1

    #using the wget command to download the file at a specific location
    wget -P $loc1 $URL_File
    echo "The download is completed! "
}

#calling the function
download_url

if [ -f $loc1/index.html ]; then
    title=$(sed -n '/<title>/ {
                s/<title>//
                s/<\/title>//
                p
            }' $loc1/index.html)
    echo "Downloaded a page with the title: $title"
else
    echo "No index.html found."
fi
exit 0
