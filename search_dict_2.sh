#!/bin/bash

function printCountedMatches {
        userInput=$1
        matches=$( egrep -ic $userInput /usr/share/dict/words )
        echo Your search matched matches $matches words.
}

function printMatches {
        userInput=$1
        matches=$( egrep -i $userInput /usr/share/dict/words )
        echo These are the words your search matched:

        if [ -z "$matches" ]; then
                echo No words matched
                return
        fi

        for match in $matches
        do
                echo $match
        done
}

clear
echo Please enter a word to search for and then press enter
read input
printCountedMatches $input
printMatches $input
