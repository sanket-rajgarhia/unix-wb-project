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


#The main game function.
function guessing_game()
{
    #Call set up before starting the game.
    setup
    #The number of files in the game directory.
    no_of_files=$(ls -al | grep -E '^[-]' | wc -l)
    #Welcome
    echo "*******************************************"
    echo "Welcome to The Guessing Game - version 0.1."
    echo "*******************************************"
    echo "Guess the number of files in the current   "
    echo "directory to win."
    echo ""

    #Prompt the user to guess the number of files - till the user wins.
    guess=0
    while [[ $guess -ne $no_of_files ]]
    do
        #Get the user's guess
        echo -n "Enter your guess : "
        read response

        #Check if a valid number has been enterd.
        if [[ ! $response =~ ^[-+]?[0-9]+$ ]]
        then
            echo "Please enter a number to play the game."
            continue
        fi

        #Check if the user guessed the number of files correctly.
        if [[ $response -eq $no_of_files ]]
        then
            #User has guessed correctly - display the victory message and
            #exit the program with a success code.
            echo "You have guessed correctly - you Win!"
            exit 0
        else
            #User has either guessed too low or too high.
            #Prompt to try again.
            if [[ $response -lt $no_of_files ]]
            then
                echo "Your guess was too low. Try again."
            else
                echo "Your guess was too high. Try again."
            fi
        fi
    done
}

#Start the game
guessing_game
