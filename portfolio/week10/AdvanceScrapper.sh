#!/bin/bash

curl -s https://www.ecu.edu.au/degrees/study-areas/science |

grep 'www.ecu.edu.au/degrees/study-areas/science' |
sed 's/ <a href=\"https:\/\/www.ecu.edu.au\/degrees\/study-areas\/science\//""/g
s/title=.*>//g
s/-/ /g' |
awk 'BEGIN{
    RN=3; 
    FS="\""
    }
{
    if (NR >4 && NR <14)
        printf "%s \n", $3
}'
