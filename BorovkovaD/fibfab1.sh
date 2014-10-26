#!/bin/bash -x
function fib 
{
	#echo "fib $1"
	a=1
	b=0
	c=0
	if [[ "$1" -eq 0 ]]
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
function fac {
	echo fac $1
	a=1
	if [[ "$1" -eq 0 ]]
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
case "$1" in
fib) fib $2;;
fac) fac $2;;
*) echo err;;
esac