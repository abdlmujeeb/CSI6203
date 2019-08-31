#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will print out every third number until 1000
j=0
#For numbers between 1 and 1000
for ((i = 1; i <= 1000; i++))
do
#if the number is 1 then print it on screen else move to next condition
    if (( i==1 )); then
     echo $i
    fi
#Here we check if the number is 3rd or not.
    if (( j == 3 )) ; then
        echo $i
#if the number is third then we print the number and the variable is made 0 to start again.
        j=0
    fi
    ((j++))
done
