#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script shows some examples of grep commands.


cd ~/CSI6203
grep -r "^sed"
grep -r "^m"
grep -r '[0-9]\{3\}'
grep -r "^[aeiouAEIOU]"
grep -r -E '(while )|(for )|(unitl )'
grep -r -E '(^echo) .* .* .*'