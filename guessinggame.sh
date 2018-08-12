#!/usr/local/env bash

#This function sets up the game environment.
#The function generates a random number of files in the current directory for
#facilitating the game.
function setup
{
    #Remove any test files created for the purpose of the game
    #on a previous run.
    rm -f guess-test-file*.*

    #Generate a random number between 1 and 100.
    random=$(expr $(expr $RANDOM % 100) + 1)

    #Creates test_files in the current directory between 1 and 100.The files
    #generated have the naming format : guess-test-fileN.txt ('N' is 1 to 100).
    eval touch guess-test-file{1..$random}.txt

    #Clear the screen.
    clear
}

#Test
setup
ls -al | grep -E '^[-]' | sort -nk 8
echo "Total Number of file " : $(ls -al | grep -E '^[-]' | wc -l)
