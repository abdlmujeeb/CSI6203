#!/bin/bash
#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will print your shopping list in tabulated formated.
echo "Your shopping list is as follows:"
awk 'BEGIN {
FS=",";
currency="$";
    print "Item     | Quantity  | Price ";
    print "_________|___________|_______"

}
{
printf "%-13s| %-2d     | %c%2.2f\n", $1, $2, currency, $3
}' shopping.csv
