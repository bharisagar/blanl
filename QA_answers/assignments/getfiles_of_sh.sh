# write a script get all the files with extension of .sh using for loop.

for file in *.sh
do
    if [ -f "$file" ]; then
        echo "here is the list of file contain .sh: $file"
    fi
done

