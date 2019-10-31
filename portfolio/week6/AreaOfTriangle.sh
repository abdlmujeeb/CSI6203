#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script finds the area of triangle.

finding_area(){
    #Calculating the area with formula ((1/2) * base * height)
    area=$(echo "scale=2;(1/2) * $base * $height"|bc)
    #printing the area
    echo $area
}

for(( base=1; base<10; base++ )); do
    for((height=1; height<10; height++ )); do
        area=$(finding_area $base $height)
        echo "The area of triangle with base: $base and height: $height is :" $area
    done
done
exit 0