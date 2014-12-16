#!/bin/bash

source factfiboprime.sh
function printhelp 
{
	echo "  -fib
	return n-th fibonacci number
  -fact
	return factorial n
  -prime
	return 1 if n is prime number, 0 if n is not prime number"

}


case $1 in

-fib) fibonacci $2 ;;
-fact) factorial $2 ;;
-prime) isPrime $2 ;;
-help) printhelp ;;

esac

