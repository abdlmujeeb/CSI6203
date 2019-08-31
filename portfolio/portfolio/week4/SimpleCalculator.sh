#!/bin/bash
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