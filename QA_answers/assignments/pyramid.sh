#!/bin/bash

for (( i=1; i<=6; i++ ))
do
  for (( j=6; j>i; j-- ))
  do
    echo -n " "
  done

  for (( k=1; k<=((2*i-1)); k++ ))
  do
    echo -n "*"
  done

  echo
done
