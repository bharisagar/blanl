#!/bin/bash
read -p "Enter a string: " input
len=${#input}
reverse=""

for (( i=$len-1; i>=0; i-- ))
do
  reverse="$reverse${input:$i:1}" # ${input:$i:1} — extracts one character at a time
done

if [ "$input" == "$reverse" ]; then
  echo "$input is a palindrome."
else
  echo "$input is not a palindrome."
fi
