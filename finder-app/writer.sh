#!/bin/bash
# Check if correct number of arguments are passed
if [ $# -ne 2 ]; then
	echo "ERROR : Two arguments required: <writefile> <writestr>"
	exit 1
fi

#Assign the directory and string to variables
writefile=$1
writestr=$2

# Extract directory from the given file path
writedir=$(dirname "$writefile")

# Create directory path if it doesn’t exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory $writedir"
    exit 1
fi

# Write the string into the file (overwrite if exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi
