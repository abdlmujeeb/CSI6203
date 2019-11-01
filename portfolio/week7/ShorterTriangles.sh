#!/bin/bash

~/CSI6203/portfolio/week6/AreaOfTriangle.sh | sed -e '
s/$area //
s/Area of triangle with //
s/and //
s/is/Area/
s/h/H/
s/b/B/
'

#    area=$(echo "scale=2;(1/2) * $base * $height"|bc)
