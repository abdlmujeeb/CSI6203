#!/bin/bash
base_url="https://apod.nasa.gov/apod/"
getting_title () {
    getting_title=$(wget -q -O - "$@"  ${base_url}${trim}.html | grep "<title>" | sed -e 's#.*-\(\)#\1#')
    echo $getting_title
}
download_image () {
    get_image_url=$(wget -q -O - "$@"  "${base_url}${trim}.html" | sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p')
    title=$(getting_title)
    echo "Connecting to nasa.gov.."
    echo ""
    echo "Downloading \"$title.jpg\""
    echo ""
    image_url="${base_url}${get_image_url}"
    download_image=$(wget --quiet $image_url -O "$title.jpg")
    echo "Finsihsed"
    
}
get_description () {
    echo "Parsing description"
    echo "${base_url}${trim}.html"
    sed -n '/<b> Explanation: <\/b>/,/<p> <center>/p' "${base_url}${trim}.html" |
    sed -e :a -e 's/<[^>]*>//g;/</N;//ba' |
    grep -Ev 'Explanation:' |
    tr '\n' ' ' |
    sed 's/  /\n\n/g' |
    awk 'NF { print $0 "\n" }' |
    sed 's/^[ \t]*//' |
    echo "sed 's/[ \t]*$//'"
}
#if (( "$1" == -d)); then
#    trim=$(echo "$2" | sed 's/-//g' | sed -r 's/[20]+/ap/')
#    download_image
#else
#echo "$#"
#exit 1
#fi

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -d|--date)
        trim=$(echo "$2" | sed 's/-//g' | sed -r 's/[20]+/ap/')
       # download_image
        shift # Remove --initialize from processing
        ;;
        -t|--type)
         if (( -t == explanation )); then
         trim=$(echo "$4" | sed 's/-//g' | sed -r 's/[20]+/ap/')
         get_description
         else "$#"
         fi
        ;;
        *)
        OTHER_ARGUMENTS+=("$1")
        shift # Remove generic argument from processing
        ;;
    esac
done