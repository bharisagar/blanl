#!/bin/bash
mkdir -p dir1

for i in {1..5}; do
    touch "dir1/file$i.txt"
done

echo "Created 5 files in dir1"
-----------------------------------------
to list files from dir1/dir2/dir3
#!/bin/bash 
mkdir -p dir1/dir2/dir3
for i in {1..5}; do
    touch "dir1/dir2/dir3/file$i.txt"
done
echo "Created 5 files in dir1/dir2/dir3"
-----------------------------------------
# to list files from dir1/dir2/dir3
#!/bin/bash
directories=("dir1" "dir2" "dir3")


for dir in "${directories[@]}"; do
    echo "Checking directory: $dir"
   
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            echo " list file: $file"
        fi
    done
done