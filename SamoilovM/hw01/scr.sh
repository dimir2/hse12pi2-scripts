#!/bin/bash

l=1 #final fibonacci number
j=1 #previous fibonacci number
k=0 #pre-previous fibonacci number

function fib {
	if [ $1 -eq 0 ] #the 0 fibonacci number
	then
		l=$k
	elif [ $1 -eq 1 ] #the 1 fibonacci number
	then
		l=$j
	else
		for i in `seq 2 $1`
		do 
			l=`expr $j + $k`
			k=$j		
			j=$l
		done
	fi

	echo $l
}

m=1 #factorial number

function fac {
	for i in `seq 1 $1`
	do 
		m=`expr $m \* $i`
	done
	echo $m
}

fib $1 #the first argument is fibonacci number
fac $2 #the second argument is factorial number

exit 0
