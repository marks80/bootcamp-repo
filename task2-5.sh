#!/bin/bash

#Task2. Lists all files in a given directory modified in the last X days(using for Loop, special variables)


# Assign the first argument to the variable 'directory'
directory=$1

# Assign the second argument to the variable 'days'
days=$2

# Loop through all files in the specified directory
for file in "$directory"/*; do
  # Check if the file was modified within the specified number of days
  if [[ $(find "$file" -mtime -$days -print -quit) ]]; then
    # Print the file name
    echo "$file"
  fi
done

#!/bin/bash

# Check if the number of arguments is not equal to 2
[ $# -ne 2 ] && echo "Usage: $0 /path/to/directory X (days)" && exit 1

# Check if the provided directory path does not exist
[ ! -d "$1" ] && echo "Directory '$1' does not exist!" && exit 1

# Use the 'find' command to list files modified within the specified number of days
find "$1" -type f -mtime -"$2"


