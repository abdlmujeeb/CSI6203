#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script is a calculator which reads inputs from the command line
# If Addition is done then the result is shown in BLUE Color
# If Subtraction is done then the result is showin in Green Color
# If Multiplication is done then the result is shown in Red Color
# If Division is done then the result is shown in Purple Color
OP=$2
if [ "$OP" == "+" ]; then
echo -e "\033[34m $(( $1 $2 $3 ))\\033[0m"
elif [ "$OP" == "-" ]; then
echo -e "\033[32m $(( $1 $2 $3 ))\\033[0m"
elif [ "$OP" == "x" ]; then
echo -e "\033[31m $(( $1 * $3 ))\\033[0m"
elif [ "$OP" == "/" ]; then
echo -e "\033[35m $(( $1 $2 $3 ))\\033[0m"
else 
echo "This is not supported"
fi
exit 0