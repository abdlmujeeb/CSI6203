#!/bin/bash

getting_title=$(wget -q -O - "$@"  https://apod.nasa.gov/apod/archivepix.html | grep "2019 October 10" | sed -r 's#^.*<a href="([^"]+)">([^<]+)</a>.*$#\2#')
echo $getting_title
getting_image_url=$(wget -q -O - "$@"  https://apod.nasa.gov/apod/archivepix.html | grep "2019 October 10" | sed -r 's#^.*<a href="([^"]+)">([^<]+)</a>.*$#\1#')
base_url="https://apod.nasa.gov/apod/"
image_url="${base_url}${getting_image_url}"
get_image_url=$(wget -q -O - "$@"  "$image_url" | sed -n 's/.*<IMG SRC="\([^"]*\)".*/\1/p')
image_url="${base_url}${get_image_url}"
jpg=".jpg"
image_title="${getting_title}${jpg}"
download_image=$(wget $image_url -O "$image_title")



