#!/bin/bash

# Set up necessary info
# Username, password, and IP address may vary, so adjust them as needed
USERNAME=pi
PASSWORD=raspberry
ADDR=192.168.1.43

# Set up paths
# First two are for testing, the other two are the real deal
TEST_START="test_start"
TEST_END="test_end"
ROMS_FOLDER="roms"
RETROPIE_PATH="~/RetroPie"

# Source: 
# https://stackoverflow.com/questions/58928166/how-to-create-a-dictionary-from-a-text-file-in-bash
declare -A ROM_EXTENSIONS
while IFS='|' read -r key value; do
    ROM_EXTENSIONS[$key]=$value
done < systems_ext.txt

# Set single character flag arguments here
# Read more on 'getopts' command:
# https://google.github.io/styleguide/shellguide.html#case-statement
TEST_FLAG='false'
while getopts 't' flag; do
  case "${flag}" in 
    t) TEST_FLAG='true' ;;
  esac
done

echo " "
echo "*********************"
echo "Adding your ROMS to your respective system..."
echo "*********************"
echo " "

# Parameters:
# $1 Start Folder
# $2 End Folder
copy_roms_to_pi () {
  # Iterate through each system folder 
  for SYS_FOLDER in "$1"/**
  do
    # If there is a directory, iterate through it for ROMs 
    if [ -d "$SYS_FOLDER" ]; then
      for ROM in "$SYS_FOLDER"/*
      do
        # If the ROM is a file, copy it to the destination folder 
        if [ -f "$ROM" ]; then
          # Super useful post for replacing substrings
          # Source: https://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script
          if [[ $TEST_FLAG = 'true' ]]; then
            DST="./${ROM/$1/$2}"
            cp "./$ROM" "$DST"
            echo "cp: Added '${ROM##*/}' to '$DST'"
          else
            DST="$USERNAME@$ADDR:$RETROPIE_PATH/$ROM"
            DST="${DST/$1/$ROMS_FOLDER}"
            rsync -a --ignore-existing "$ROM" "$DST"
            echo "rsync: Added '${ROM##*/}' to '$DST'"
          fi
        fi
      done
    fi
  done
}

# Loop through system folders and rsync each ROM to the dst folder and its subfolders
if [[ $TEST_FLAG = 'true' ]]; then
  copy_roms_to_pi "$TEST_START" "$TEST_END"
else
  copy_roms_to_pi "$ROMS_FOLDER" "$RETROPIE_PATH"
fi
