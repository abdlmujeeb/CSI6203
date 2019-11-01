#!/bin/bash
#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will print out the content of shopping.csv and removes comma from the output
echo "Your shopping list is as follows:"
awk 'BEGIN {
FS=","
}
{
print $1
}' shopping.csv