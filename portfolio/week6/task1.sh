#!/bin/bash

Var1=$1
printError()
{
    echo -e "\033[31mERROR:\033[0m " $Var1
}
printError