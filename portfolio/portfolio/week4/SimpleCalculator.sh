#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script is a calculator which uses USE CASE where user selects the option.
# If Addition is done then the result is shown in BLUE Color
# If Subtraction is done then the result is showin in Green Color
# If Multiplication is done then the result is shown in Red Color
# If Division is done then the result is shown in Purple Color

echo "Select Your Option"
echo "  1)Addition"
echo "  2)Subtraction"
echo "  3)Multiplication"
echo "  4)Division" 

read n
case $n in
  1) echo "Enter the values for addition";
     read -p "Enter first number : " firstValue
     read -p "Enter second number : " secondValue
     a=$(( firstValue + secondValue ))
     echo -n "Your result is :" 
     echo  -e "\033[34m$a\033[0m"
      ;;
  2) echo "You chose Subtraction";
     read -p "Enter first number : " firstValue
     read -p "Enter second number : " secondValue
     a=$(( firstValue - secondValue ))
     echo  -e "Your result is : \033[32m$a\033[0m"
  ;;
  3) echo "You chose Multiplication";
     read -p "Enter first number : " firstValue
     read -p "Enter second number : " secondValue
     a=$(( firstValue * secondValue ))
     echo -e "Your result is : \033[31m$a\033[0m"  
  ;;
  4) echo "You chose Division";
     read -p "Enter Numerator : " firstValue
     read -p "Enter Denominator : " secondValue
     a=$(( firstValue / secondValue ))
     echo -e "Your result is : \033[35m$a\033[0m"  
  ;;
  *) echo "invalid option";;
esac
exit 0