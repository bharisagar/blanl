#write a script to add content into a file using while loop.
#!/bin/bash
read -p "Enter the file name: " file_name
if [ -f "$file_name" ]; then
    echo "$file_name exists. i can add content to it."
else
    echo "$file_name does not exist. Creating the file."
    touch "$file_name"
fi
echo "Enter content to add to $file_name (type 'exit' to finish):"
while true; do
    read -p "> " line
    if [ "$line" == "exit" ]; then
        break
    fi
    echo "$line" >> "$file_name"
done
echo "Content added to $file_name."
