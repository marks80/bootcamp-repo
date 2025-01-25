# TASK3. Counts how many times a given word appears in a text file. 
# The script should accept the word and filename as arguments. 
# Handle potential bugs in user input and file handling.

#!/bin/bash

# Check if the correct number of arguments was provided by the user
if [ $# -ne 2 ]; then
    echo "Usage: $0 <word> <filename>"
    exit 1
fi


# Assign arguments to variables
WORD="$1"
FILE="$2"


# Validate that the file exists
if [ ! -f "$FILE" ]; then
    echo "File '$FILE' does't  exist"
    exit 1
fi


# Count occurrences of the word using a loop
COUNT=0
for LINE in $(cat "$FILE"); do
    if [ "$LINE" = "$WORD" ]; then
        COUNT=$((COUNT + 1))
    fi
done

# Output the result
echo "The word '$WORD' appears $COUNT times in file '$FILE'."
