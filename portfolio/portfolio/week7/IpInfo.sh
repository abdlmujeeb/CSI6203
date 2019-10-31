#!/bin/bash
net_info="$(ifconfig)"
addresses=$(echo "$net_info" | sed -n '/inet / {
s/inet/IP Address:/p}')
echo -e "IP addresses on this computer are:\n $addresses"