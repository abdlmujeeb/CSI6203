#!/bin/bash

echo "Auth Log: "
awk 'BEGIN {
    FS=" ";
}
{
    print $1, $2, $3
    printf "%s   \n      ", $5
    
    for(i = 7; i<NF; i++)
    {
        printf "%s ", $i
    }
    print "\n"
}' /var/log/auth.log