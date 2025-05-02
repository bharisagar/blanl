#!/bin/bash
#Prompts the user to enter a string and stores it in the variable input.
read -p "Enter a string: " input

# Convert string to array
chars=($(echo "$input" | sed -e 's/./& /g'))
#s/./& /g is a sed substitution command:
# . matches any character.
# & represents the matched character.
# So, s/./& /g replaces each character with itself followed by a space.

# Reverse using loop
reversed=""
for (( i=${#chars[@]}-1; i>=0; i-- )); do
    reversed+="${chars[i]}"
done
#This loop goes backwards through the chars array:

# ${#chars[@]}: Gives the number of elements in the array.

# We subtract 1 because array indices start from 0.

# i--: We decrement i to loop from end to start.

echo "Reversed string: $reversed"
