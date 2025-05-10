#!/bin/bash

path="/home/ec2-user"
# Count files properly by piping find results to wc -l
file_count=$(find "$path" -type f 2>/dev/null | wc -l)
# Print the file count
echo "Total files in $path: $file_count"
# Check if file count is less than 1 to 5
for i in {1..5}; do
    if [ "$file_count" -lt "$i" ]; then
        echo "Files count ($file_count) is less than $i"
    fi
done
# Check if file count is greater than 5       