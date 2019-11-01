#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script finds the area of triangle.


get_area(){
    #here we find the area of triangle with decimal value.
    area=$(echo "scale=2;(1/2) * $base * $height"|bc)
    #printing the area
    echo $area
}

#This will loop from 1 to 10 and find the area.
for(( base=1; base<=10; base++ )); do
    for((height=1; height<=10; height++ )); do
        area=$(get_area $base $height)
        echo "Area of triangle with base: $base and height: $height is :" $area
    done
done
exit 0