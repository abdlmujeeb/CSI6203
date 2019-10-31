#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script prints the error in color.

Var1=$1
printError()
{
    echo -e "\033[31mERROR:\033[0m " $Var1
}
printError