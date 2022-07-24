#!/bin/bash

# Set up necessary info
USERNAME=pi
PASSWORD=raspberry
ADDR=192.168.1.183
echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"

# Set up paths on RetroPie-powered Raspberry Pi
ROMS_PATH="~/RetroPie/roms/"

# Source: 
# https://stackoverflow.com/questions/58928166/how-to-create-a-dictionary-from-a-text-file-in-bash
declare -A ROM_EXTENSIONS
while IFS='|' read -r key value; do
    ROM_EXTENSIONS[$key]=$value
done < systems_ext.txt

for i in "${!ROM_EXTENSIONS[@]}"
do
  echo "key  : $i"
  echo "value: ${ROM_EXTENSIONS[$i]}"
done

# Loop for inserting the files into RetroPie 
i=1
for rom in "$@"
do
    echo "ROM File $1: $rom"
    i=$((i + 1));
    # scp $rom ${USERNAME}@${ADDR}:${ROMS_PATH}/
    
done