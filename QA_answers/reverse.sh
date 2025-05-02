#!/bin/bash 
#using rev command to reverse the string
# This script reverses a string using the rev command
# and prints the reversed string.
Name="Happy"

rev_string=$(echo "$Name" | rev)
echo " Revesred string of $Name is :$rev_string "
