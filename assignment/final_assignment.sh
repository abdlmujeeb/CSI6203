#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script fetches the data from the nasa website.

base_url="https://apod.nasa.gov/apod/"

if curl -s --head  --request GET $base_url | grep "200 OK" > /dev/null; then echo ""
else
   echo "Website down"
   exit;
fi

getting_title () { #Gets the title for the respective page.

    getting_title=$(wget -q -O - "$@"  ${base_url}${trim}.html | grep "<title>" | sed -e 's#.*-\(\)#\1#')

    #grep "<title>" = Finds the title tag.

    #sed -e 's#.*-\(\)#\1#' = Gets the content within the title tag.

    echo $getting_title
}
download_image () { #downloads the image from the respective date.

    get_image_url=$(wget -q -O - "$@"  "${base_url}${trim}.html" | sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p')

    #sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p = This will get the image link.

    title=$(getting_title) #gets the title of the image from getting_title function.

    echo "Connecting to nasa.gov.."

    echo ""

    image_url="${base_url}${get_image_url}"

    #This if else condition is used to find the extension of the image file.

    if [[ $image_url == *".jpg"* ]]; then

        image_extension=".jpg"

    elif [[ $image_url == *".png"* ]]; then

        image_extension=".png"

    elif [[ $image_url == *".gif"* ]]; then

        image_extension=".gif"

    fi

    title="${title}${image_extension}"

     echo "Downloading \"$title\""

    download_image=$(wget --quiet $image_url -O "$title")

    #wget is used to download the image and save in the respective title of the image.

    echo ""

    echo "Finsihsed"
    
}

get_explanation () { #gets the explanation of the specific date.

echo "Connecting to nasa.gov.."

echo ""

explanation=$(curl -s ${base_url}${trim}.html | sed -n '/<b> Explanation: <\/b>/,/<b> Tomorrow/p' | sed -e 's/<[^>]*>//g' | sed 's/<a href=*//g;s/>//g' | sed '/^$/d' | sed '/http:/d' | sed '/https:/d' | sed s/Tomorrow.*//g)
#sed -n '/<b> Explanation: <\/b>/,/<b> Tomorrow/p' = This will get the content between Explanation and Tomorrow from the html.
#sed -e 's/<[^>]*>//g' = This will remove all the html tags
#sed 's/<a href=*//g;s/>//g' = This will remove all a href tags.
#sed '/http:/d' | sed '/https:/d' = If any http/https links are present in the text this will remove it.
#sed s/Tomorrow.*//g = We get the content till tomorrow for the explanation.

echo $explanation   

echo ""

echo "Finsihsed"

}
function get_details () { #Gets the respective details of a specific date.

echo "TITLE: $(getting_title)"  

echo ""

echo "EXPLANATION: "

echo ""

explanation=$(curl -s ${base_url}${trim}.html | sed -n '/<b> Explanation: <\/b>/,/<b> Tomorrow/p' | sed -e 's/<[^>]*>//g' | sed 's/<a href=*//g;s/>//g' | sed '/^$/d' | sed '/http:/d' | sed '/https:/d' | sed s/Tomorrow.*//g)
#sed -n '/<b> Explanation: <\/b>/,/<b> Tomorrow/p' = This will get the content between Explanation and Tomorrow from the html.
#sed -e 's/<[^>]*>//g' = This will remove all the html tags
#sed 's/<a href=*//g;s/>//g' = This will remove all a href tags.
#sed '/http:/d' | sed '/https:/d' = If any http/https links are present in the text this will remove it.
#sed s/Tomorrow.*//g = We get the content till tomorrow for the explanation.

echo $explanation

echo ""

credit=$(curl -s ${base_url}${trim}.html | sed -n '/Credit/,/Explanation/p' | sed -e 's/<[^>]*>//g' | sed 's/<a href=*//g;s/>//g')
# sed -n '/Credit/,/Explanation/p' = This will take the content between Credit and Explanation
# sed -e 's/<[^>]*>//g' = This will remove all the html tags.
# sed 's/<a href=*//g;s/>//g' = This will remove all the html links.

echo $credit

}

function get_image_range () {

range1=$(echo $trim1 | sed 's/ap//g')

range2=$(echo $trim2 | sed 's/ap//g')

count=`expr $range2 - $range1`

if [ $count -le 10 ]; then

echo "Connecting to nasa.gov.."

for (( new_date=$range1; new_date<=$range2; new_date++))

do

newdate=ap$new_date

title=$(wget -q -O - "$@"  ${base_url}${newdate}.html | grep "<title>" | sed -e 's#.*-\(\)#\1#')

get_image_url=$(wget -q -O - "$@"  "${base_url}${newdate}.html" | sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p')

#sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p = This will get the image link.

image_url="${base_url}${get_image_url}"

#This if else condition is use to find the extension of the image file.

    if [[ $image_url == *".jpg"* ]]; then

        image_extension=".jpg"

    elif [[ $image_url == *".png"* ]]; then

        image_extension=".png"

    elif [[ $image_url == *".gif"* ]]; then

        image_extension=".gif"

    fi

    title="${title}${image_extension}"

     echo "Downloading \"$title\""

download_image=$(wget --quiet $image_url -O "$title")

#wget is used to download the image and save in the respective title of the image.

#    echo "Finsihsed"

done

echo "Finished"
else 
    echo "Please enter range less than 10 dates."
fi

exit;


}
# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -d)
           trim=$(echo "$2" | sed 's/-//g' | sed -r 's/[20]+/ap/')
           download_image
        shift 1
        ;;# Remove --initialize from processing
        --date)
        trim=$(echo "$2" | sed 's/-//g' | sed -r 's/[20]+/ap/')
        shift 1;;
       --type)
       trim=$(echo "$4" | sed 's/-//g' | sed -r 's/[20]+/ap/')
            get_explanation
            exit 0;
        shift 1;;
        -t)
               trim=$(echo "$4" | sed 's/-//g' | sed -r 's/[20]+/ap/')
            get_details
            exit 0;
        shift 1;;      
       --range)
         trim1=$(echo "$2" | sed 's/-//g' | sed -r 's/[20]+/ap/')
         trim2=$(echo "$3" | sed 's/-//g' | sed -r 's/[20]+/ap/')
        get_image_range "$trim1" "$trim2" 
        exit 0;
       	shift 1;;
		*) shift 1;;
    esac
done

