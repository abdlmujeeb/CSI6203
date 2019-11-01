#!/bin/bash

# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will print your shopping list in tabulated formated with totals
echo "Your shopping list is as follows:"
awk 'BEGIN {
FS=",";
currency="$";
total_quantity=0;
total_price=0;

Total1=0;
Total2=0;

    print "Item     | Quantity  | Price ";
    print "_________|___________|_______"

}
{
    Total1= $2 * $3
printf "%-13s| %-2d     | %c%2.2f\n", $1, $2, currency, $3,
currency, TOTAL1;
    totalQuantity += $2;
    totalPrice += $3;
    Total2=Total2+Total1
}
END{
    printf "TOTAL:      | %d    | %c%05.2f\n", totalQuantity, currency, totalPrice, currency, TOTAL2
}' shopping.csv
