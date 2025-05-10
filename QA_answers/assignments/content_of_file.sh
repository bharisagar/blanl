#write a shell script to read the content of a file line by line using while loop.
#IFS is used to prevent leading/trailing whitespace from being trimmed
#read -r line is used to read the line without interpreting backslashes

read -p "Enter the file name: " file_name

if [ -f "$file_name" ]; then
    echo "Reading $file_name line by line:"
    while IFS= read -r line; do 
        echo "$line"
    done < "$file_name"
else
    echo "Error: $file_name does not exist"
fi