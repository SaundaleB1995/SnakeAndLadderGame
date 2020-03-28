#!/bin/bash
echo "==> Welcome to Snake and Ladder Game <<=="
    initialPosition=0
    currentPosition=0
     NoPlay=0
     Ladder=1
     Snake=2
     winnigPosition=100
     player1=0
     player2=0
     flag=0
     counter=0

    function randomValue(){
        ((counter++))
        getValue=$((RANDOM%6+1))
        echo "Dice the Number:" $getValue
        Check_NoPlay_Ladder_Snake
    }
    randomValue

    function Check_NoPlay_Ladder_Snake(){

        position=$((RANDOM%3))
        case $position in
        $NoPlay)
             echo "For No Play=" $position
             currentPosition=$currentPosition
        ;;

        $Ladder)
              echo "For Ladder=" $position
              currentPosition=$(($currentPosition + $getValue))
                if [[ $currentPosition -gt $winnigPosition ]]
                then
                   currentPosition=$(($currentPosition - $getValue))
                fi
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

    function SwitchTurnPlayer(){
          while [ $currentPosition -ne $winnigPosition ]
          do
        	if [[ flag -eq 0 ]]
        	then
            		currentPosition=$player1
            		randomValue
            		player1=$currentPosition
             		flag=1
        	else
            		currentPosition=$player2
            		randomValue
            		player2=$currentPosition
             		flag=0
        	fi
    	  done
            checkWinner
   }

   function checkWinner()
    {
        if [ $player1 -eq $winnigPosition ]
        then
            echo " Player One Won."
            echo " Number Of Dices :" $(($counter + 1))
        else
            echo " Player Two Won."
            echo " Number Of Dices :" $(($counter))
        fi
    }
    SwitchTurnPlayer
