#!/bin/bash

curl -s http://www.example.com | sed -n -r 's/<h1>(.*)<\/h1>/\1/p; s/<p>(.*)/\1/p; s/<p>(.*)<\/p>/\1/p'