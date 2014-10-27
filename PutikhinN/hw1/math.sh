#!/bin/bash

function getFib() {
	if [ $1 -le 0 ]; then
		echo 0
		return
	fi
	declare -i ctr=2
	declare -i fibPrev=1
	declare -i fibCur=1
	while [ $ctr -lt $1 ]; do
		declare -i tmp=$fibCur
		fibCur=$(($fibCur + $fibPrev))
		fibPrev=$tmp
		((ctr++))
	done
	echo $fibCur
}

function getFac() {
	declare -i ctr=1
	declare -i result=1
	while [ $ctr -le $1 ]; do
		result=$(($result * $ctr))
		((ctr++))
	done
	echo $result
}

function isPrime() {
	if [ $1 -le 1 ]; then
		echo 0
		return
	elif [ $1 -eq 2 ]; then
		echo 1
		return
	elif [ $(($1 % 2)) -eq 0 ]; then
		echo 0
		return
	fi
	declare -i i=3
	declare -i bound=$1/2
	while [ $i -lt $bound ]; do
		if [ $(($1 % $i)) -eq 0 ]; then
			echo 0
			return
		fi
		((i+=2))
	done
	echo 1
}

function printHelp() {
	echo "Usage:
	math.sh -[fib|fac|prime] NUMBER
Arguments:
	-fib	output Nth Fibonacci number
	-fac	output N!
	-prime	test N for primality
	-help	display help and exit"
}

case $1 in
	-fib)
		echo $(getFib $2);;
	-fac)
		echo $(getFac $2);;
	-prime)
		if [ $(isPrime $2) -eq 1 ]; then
			echo $2 is prime
		else
			echo $2 is not prime
		fi;;
	-help) printHelp;;
	*) printHelp;;
esac

exit 0