#Write a script to get the factorial of the number 5

number=5
factorial=1

for ((i=1; i<=number; i++)); do
    factorial=$((factorial * i))
done

echo "The factorial of $number is: $factorial"