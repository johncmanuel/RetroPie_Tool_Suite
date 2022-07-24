#!/bin/bash

# Set up necessary info
USERNAME=pi
PASSWORD=raspberry
ADDR=192.168.1.183
echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"

# Loop for inserting the files into RetroPie 
i=1
for rom in "$@"
do
    echo "ROM File $1: $rom"
    i=$((i + 1));
    
done