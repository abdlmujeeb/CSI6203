#!/bin/bash
echo "Your shopping list is as follows:"
awk 'BEGIN {
FS=","
}
/^[aeiou]/ {
    print "starts with a vowel: " $1
}
/^o/ {
    print "start with an o: " $1
}
/[a-z] .*/ {
    print "has more than one words: " $1
}
{
if($3==int($3)){
    print "whole number price: " $1
}
}
' ../week9/shopping.csv