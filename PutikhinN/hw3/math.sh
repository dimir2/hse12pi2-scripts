#!/bin/bash

source mathlib.sh

function validatePositiveInteger() {
	RE='^0*[1-9][0-9]*$'
	if [[ $1 =~ $RE ]]; then
		return 0
	else
		echo "Error: expected positive integer"
		return 1
	fi
}

function validateNonnegativeInteger() {
	RE='^([0-9]+|-0*)$'
	if [[ $1 =~ $RE ]]; then
		return 0
	else
		echo "Error: expected nonnegative integer"
		return 1
	fi
}

function printHelp() {
	echo "Usage:
	math.sh -[fib|fibd|fac|prime] NUMBER
Arguments:
	-fib	output Nth Fibonacci number recursively
	-fibd	output Nth Fibonacci number recursively - optimized with array
	-fac	output N!
	-prime	test N for primality
	-help	display help and exit"
}

case $1 in
	-fib)
		validateNonnegativeInteger $2 && echo $(getFib $2);;
	-fibd)
		validateNonnegativeInteger $2 && echo $(getFibD $2);;
	-fac)
		validateNonnegativeInteger $2 && echo $(getFac $2);;
	-prime)
		validatePositiveInteger $2 &&
			if [ $(isPrime $2) -eq 1 ]; then
				echo $2 is prime
			else
				echo $2 is not prime
			fi;;
	-help) printHelp;;
	*) printHelp;;
esac

exit 0
