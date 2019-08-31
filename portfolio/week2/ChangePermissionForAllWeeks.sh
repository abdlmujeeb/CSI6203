#!/bin/bash
# Author : Abdul Mujeeb Mohammed
# Edith Cowan University Sydney
# 10490487
# This script will update the permissions of all scripting files in week1 and week2 folder.
echo 'Updating permissions of files'
chmod +x ~/CSI6203/portfolio/"week1"/*.sh
chmod +x ~/CSI6203/portfolio/"week2"/*.sh
cd ~/CSI6203/
tree
echo 'Done'