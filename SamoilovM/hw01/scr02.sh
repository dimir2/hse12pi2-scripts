#!/bin/bash

source math.lib

function help {
	echo "--fib and number for fibonacci"
	echo "--fac and number for factorial"
	echo "--pri and number to know is this number prime"
	echo "--help for call help"
}

case "$1" in
	--help)	help;;
	--fib)	fib $2;;
	--fac)	fac $2;;
	--pri)	isPrime $2;;
	*) 	echo "Wrong parametres! --help for help";;
esac

exit 0
