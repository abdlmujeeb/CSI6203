#!/bin/bash

echo "Auth Log:"
awk 'BEGIN{
    FS=" ";
    d=$(date)
}
/root/ {
    if ($1 == d($1))
    {
        print $1, $2, $3
        printf "%s  \n      ", $5
        for(i=7; i<=NF;i++)
            printf "%s ", $i
        print "\n"
    }
}' /var/log/auth.log