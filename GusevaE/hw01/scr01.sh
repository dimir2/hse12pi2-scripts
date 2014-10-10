#!/bin/bash

function fib
{
	if [ "$1" -le  2 ] ; then
		echo 1
	fi
	x=1
	y=1
	f=0
	for i in `seq 2 $1`
	do
		f=`expr $x + $y`
		x=$y
		y=$f
	done
	echo $f
	return 0
}

function fact
{
	f=1
	for i in `seq 1 $1`
	do
		f=`expr $f \* $i`
	done
	echo $f
	return 0
} 

function main
{
	case "$1" in
		fib) fib $2;;
		fact) fact $2;;
		*) echo Error;;
	esac
	return 0
}

main $1 $2
exit 0
