#/bin/bash

clear

# prompts user and takes input

    echo Please enter a number:

read input

# works out if above or below the value of ten

while (( input < 10 )); do

    echo Your number ${input} is less than 10.

    (( input = input+1 ))

    done

echo "DONE: ${input}"

exit 0
