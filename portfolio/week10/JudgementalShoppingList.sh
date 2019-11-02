#!/bin/bash

echo "The items on your shopping list is as follows: "
awk 'BEGIN{
    FS=",";
    currency="$;"
    totalQuantity=0;
    totalPrice=0;
    Comment="";
    TOTAL1=0;
    TOTAL2=0;
    print "Item     | Quantity | Price | Total | Comment ";
    print "_________|__________|_______|_______|_________"
}
{
    TOTAL1= $2 * $3;
    if(TOTAL1 > 5)
    {
        if($2 > 5)
            Comment="Do you really need that many? "
        else
        Comment="That is a bit expensice! Are you sure?"
    }
    else if(TOTAL1 <3)
        Comment="Such a cheapstake!"
    else
        Comment=""
    
    printf "%-13s| %-2d     | %c%05.2f | %c%05.2f | %s \n", $1, $2, currency, $3, currency, TOTAL1, Comment;
    totalQuantity += $2;
    totalPrice += $3;
    
    TOTAL2=TOTAL2 + TOTAL1
}
END{
    printf "TOTAL:      | %d    | %c%05.2f | %c%05.2f | \n", totalQuantity, currency, totalPrice, currency, TOTAL2
}' ../week9/shopping.csv