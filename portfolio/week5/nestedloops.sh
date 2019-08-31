#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This is a simple example of nested loop

for((i=0;i<3;i++))do
    echo "outer loop $i"
        for((j=0;j<3;j++))do
            echo "inner loop $j"
        done
done
exit 