# TASK1. Accept a directory path as argument
#        checks if directory exists
#	 displays total size of directory

# How to check?
# ./task1-5sh MarksSaulevics


#!/bin/bash

# Check if the user gave a directory
if [ -z "$1" ]; then
    echo "Enter a directory path!"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "No such directory"
    exit 1
fi

# Get the size of the directory
DIR_SIZE=$(du -sh "$1" | awk '{print $1}')

# Show the results
echo "The directory size is: $DIR_SIZE"
