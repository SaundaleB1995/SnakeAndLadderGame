#!/bin/bash
echo "==> Welcome to Snake and Ladder Game <<=="
    initialPosition=0
    currentPosition=0
     NoPlay=0
     Ladder=1
     Snake=2
     winnigPosition=100
     counter=0

    function randomValue(){
        ((counter++))
        getValue=$((RANDOM%6+1))
        echo "Dice the Number:" $getValue
    }

    randomValue

      function Check_NoPlay_Ladder_Snake()
	{

        position=$((RANDOM%3))

	  case $position in
        $NoPlay)

             echo "For No Play=" $position
            currentPosition=$currentPosition    
        ;;

        $Ladder)
            echo "For Ladder=" $position
            currentPosition=$(($currentPosition + $getValue))
        ;;

        $Snake)
            echo "For Snake=" $position
            currentPosition=$(($currentPosition - $getValue))

         if [ $currentPosition -lt 0 ]
         then
                currentPosition=0
         fi
        ;;
        esac
        echo "Current Position=" $currentPosition
    }
    Check_NoPlay_Ladder_Snake

	while [ $currentPosition -lt $winnigPosition ]
    	do
        	randomValue
        	Check_NoPlay_Ladder_Snake
            if [ $currentPosition -gt $winnigPosition ]
            then
            	currentPosition=$(( $currentPosition - $getValue ))
            	echo " Current Position="$currentPosition
            fi
        done
  echo "Number of Time dice played" $counter
