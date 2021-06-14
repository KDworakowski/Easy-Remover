#!/usr/bin/env bash

read -r -p "Write the name of the file you want to delete:"
Current_path=$PWD
cd $HOME
if [ -z "$REPLY" ]; then
    echo "You need to write the name of the file."
    exit
fi
FILES_TO_REMOVE=$(tree -if | grep "$REPLY")
echo $FILES_TO_REMOVE
if [ -z "$FILES_TO_REMOVE" ]; then
    echo "Files with a given name not found."
    exit
fi
echo "Found these files."
read -r -p "Are you sure you want to delete these files? (y/n):" response
case "$response" in
    [tT])
        echo $FILES_TO_REMOVE | xargs rm -rf
        echo "Files have been deleted."
    ;;
    *)
        echo "Ok!"
    ;;
esac
cd $Current_path
