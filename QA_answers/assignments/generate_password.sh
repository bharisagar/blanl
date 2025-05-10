# Write a script to generate the password using a for loop
#chars:$pick_chars:1 -This extracts exactly one character at the randomly selected index from the string.
password_length=12
password=""

chars="A-Za-z0-9@#%&*!"
char_count=${#chars}

for ((i=1; i<=password_length; i++)); do
    pick_chars=$((RANDOM % char_count))
    password+=${chars:$pick_chars:1}
done
echo "Generated password: $password"



