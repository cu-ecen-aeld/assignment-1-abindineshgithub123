#!/bin/bash

# Check if correct number of arguments are passed
if [ $# -ne 2 ]; then
	echo "ERROR : Two arguments required <searchdir> <serchstr>"
	exit 1
fi

# Assign the directory and string to variable
filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
	echo "ERROR : $searchdir is not a vaid directory"
	exit 1
fi

# Count total number of files in the directory and subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count total number of matching lines
line_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print result
echo "The number of files are $file_count and the number of matching lines are $line_count"
