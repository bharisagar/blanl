#Write a script that, when you enter 5, should print 54321. Same in loop till 1
#!/bin/bash
read -p "Enter a number: " n
for (( i=n; i>=1; i-- ))
do
  for (( j=i; j>=1; j-- ))
  do
    echo -n "$j"
  done
  echo
done

