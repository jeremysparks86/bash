#!/bin/bash

# Script to check the system dictionary for certain words based on user input

clear

    echo Please enter a word to search for and press enter:

read input

# Calculate how many words the search matched

var1=$( egrep -ic $input /usr/share/dict/words )

    echo Your search matched $var1 words.

# Print a list of all words matched

var2=$( egrep -i $input /usr/share/dict/words )

    echo These are the words your search matched:
    echo $var2

exit 0
