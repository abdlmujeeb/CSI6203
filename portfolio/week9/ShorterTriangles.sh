#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will print the total area calculated from Area of Triangle script.
~/CSI6203/portfolio/week6/AreaOfTriangle.sh |
awk 'BEGIN{
    FS=" ";
    total_area = 0
}
{
    printf " Base:%s Height:%s Area: %d \n", $6, $9, $12
    total_area=total_area + $12
}
END{
    printf " Total Area : %d \n", total_area
}
'