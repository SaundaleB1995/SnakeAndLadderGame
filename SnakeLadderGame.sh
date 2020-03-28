#!/bin/bash
echo "==> Welcome to Snake and Ladder Game <<=="
    
    currentPosition=0
     NoPlay=0
     Ladder=1
     Snake=2

    function randomValue(){
        getValue=$((RANDOM%6+1))
        echo "Dice the Number:" $getValue
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
