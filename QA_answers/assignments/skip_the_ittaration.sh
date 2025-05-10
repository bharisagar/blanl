#write a script to skip the iteration using while loop.
count=1

while [ $count -le 5 ]; do
    if [ $count -eq 3 ]; then
        echo "Skipping iteration $count"
        ((count++))
    fi
    echo "Processing of count: $count"
    ((count++))
done

