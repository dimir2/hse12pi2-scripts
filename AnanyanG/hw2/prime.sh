#!/bin/bash -x
function fib()
{
	#echo "fib $1"
	a=1
	b=0
	c=0
	if [ "$1" -eq 0 ]
		then
		a=0
	else
		for (( n=1; $n < "$1"; n=$n+1 ));
			do
			c=$a
			a=$(($a + $b))
			b=$c
		done
	fi
	echo $a
	return
}
function fac() {
	echo fac $1
	a=1
	if [ $1 -eq 0 ]
		then
		a=1
	else
		for (( n=1; $n < "$1"; $((n++)) ));
			do
			a=$((a*n))
		done
	fi
	echo $a
	return
}
function prime() { 
	echo prime $1
	i=2
	c=0
	j=0
	if [ $1 -eq 0 ] && [ $1 -eq 1 ]
		then echo "is not prime"
		return
	else
		for (( i=2; $i < "$1"; $((i++)) ));
			do 
			c=$[$1 % $i]
			if [ $c -eq 0 ]
				then
				echo "is not prime" 
				return
			else j=1
			fi
		done
	fi
	if [ $j -eq 0 ]
		then
		echo "is prime"
	fi
	return
}

fib $1
fac $2
prime $3
