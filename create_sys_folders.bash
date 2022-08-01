#!/bin/bash

# Set up paths
ROMS_FOLDER="roms"
TEST_START="test_start"
TEST_END="test_end"

# Source: 
# https://stackoverflow.com/questions/58928166/how-to-create-a-dictionary-from-a-text-file-in-bash
declare -A ROM_EXTENSIONS
while IFS='|' read -r key value; do
    ROM_EXTENSIONS[$key]=$value
done < systems_ext.txt

# Set flag arguments here
# Read more on 'getopts' command:
# https://google.github.io/styleguide/shellguide.html#case-statement
TEST_FLAG='false'
while getopts 't' flag; do
  case "${flag}" in 
    t) TEST_FLAG='true' ;;
  esac
done

# Parameter: Path to parent folder 
create_roms_folder () {
    if [ ! -d "$1" ]; then
        mkdir $1
        echo "Created folder: \"$1\""
    else
        echo "ROMS folder \"$1\" already created..."
    fi
}

# Create folders according to the system depicted in ROM_EXTENSIONS
# Parameter: Path to parent folder
create_sys_folders () {
    i=1
    for ROM in "${!ROM_EXTENSIONS[@]}"
    do
        # If folders don't exist, add them
        SYS_FOLDER="$1/$ROM"
        if [ ! -d "$SYS_FOLDER" ]; then
            mkdir -p $SYS_FOLDER
            echo "$i: Created folder \"$ROM\" in $1"
        else
            echo "$i: System folder \"$SYS_FOLDER\" already created..."
        fi
    i=$((i + 1));
    done
}

# If test flag is set, create the test environment by making
# directories based on the systems supported by RetroPie
if [[ $TEST_FLAG = 'true' ]]; then
    create_roms_folder "./$TEST_START"
    create_sys_folders "./$TEST_START"
    create_roms_folder "./$TEST_END"
    create_sys_folders "./$TEST_END"
else
    create_roms_folder "./$ROMS_FOLDER"
    create_sys_folders "./$ROMS_FOLDER"
fi
