#!/bin/bash
#without built in methods
# Ask for user input
read -p "Enter a string: " input

# Initialize an empty string for reversed output
reversed=""

# Get the length of the input string.
length=${#input}

# Loop from the end of the string to the beginning
for (( i=$length-1; i>=0; i-- ))
do
    reversed="$reversed${input:$i:1}"
done

# Display the reversed string
echo "Reversed string: $reversed"
