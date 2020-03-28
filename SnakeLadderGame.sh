#!/bin/bash
echo "==> Welcome to Snake and Ladder Game <<=="

    initialPosition=0
    currentPosition=$initialPosition

    function randomValue(){
        getValue=$((RANDOM%6+1))
        echo "Dice the Number:" $getValue
    }
    randomValue
