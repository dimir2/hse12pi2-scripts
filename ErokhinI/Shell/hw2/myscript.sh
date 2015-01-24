#! /bin/bash

source mylib.sh

if [ "$2" != "0" ]
then
	let "a = $2"
	if [ "$a" -eq 0 ]
	then
		helps
		exit
	fi
fi

if [ "$1" = "" ] || 
   [ "$1" = "-help" ] ||
   [ "$2" = "" ]
then
	helps
	exit
else
	if [ "$1" = "-fib" ]
	then
		fib $2
		echo $?
		exit
	fi

	if [ "$1" = "-fact" ]
	then
		fact $2
		echo $?
		exit
	fi

	if [ "$1" = "-prime" ]
	then
		prime $2
		echo $?
		exit
	fi

	helps
fi
