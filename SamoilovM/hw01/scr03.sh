#!/bin/bash

source lib03.lib

function help {
	echo "--fib_rec and number for recursive Fibonacci"
	echo "--qSort and file for sort for quick sort"
	echo "--bSort and file for sort for bubble sort"
	echo "--help for call help"
}

case "$1" in
	--help)	help;;
	--fib_rec) fib_rec $2;;
	--qSort) sort $2 q;;
	--bSort) sort $2 b;;
	*) 	echo "Wrong parametres! --help for help";;
esac

exit 0
