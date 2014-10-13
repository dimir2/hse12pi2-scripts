#!/bin/bash

function fibo_rec
{
	if [ $1 -le 0 ]
		then echo 0
	elif [ $1 -eq 1 ]
		then echo 1
	else
		echo $[ $(fibo_rec $[$1-1]) + $(fibo_rec $[$1-2]) ]
	fi
}

function factorial_rec 
{ 
	if [ $1 -lt 2 ]
	then
		echo 1
	else
		echo $[ $1 * $(factorial_rec $[$1-1]) ]
	fi
}

function main
{
	if [ $1 -le 0 ]
		then echo "NO!"
	else
		echo "fibo_rec $1: $(fibo_rec $1)"

		echo "factorial_rec $1: $(factorial_rec $1)"
	fi
}

main $1

exit 0

