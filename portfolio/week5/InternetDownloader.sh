#!/bin/bash
#ping -c 1 google.com ;  echo $?
read -p "Enter the IP address: " ipaddress
ping -c 1 "$ipaddress"  
if (( "$?" !=  0 )); then 
 echo "unavailable"
 exit 2; 
 fi

if [ "$?" -eq 0 ]; then                           
  echo "internet seems to be connected";
  while ((1)); do
  read -p "Please type a website url to download: " url
    if [ $url == "exit" ]; then
        exit 0
    fi
  wget $url
  done
else                                              
  echo "unavailablexxx"   
fi