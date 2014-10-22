#!/bin/bash

function fibo_iter
{
	a=1
	b=1
	fib=2
	i=2
	while [ $i -lt $1 ]
	do
		fib=$[$a+$b]
		a=$b
		b=$fib
		i=$[$i+1]
	done
	echo $fib
}

function factorial_iter
{
	num=1

	for i in `seq 1 $1`
	do
		num=$[$num * $i]
	done

	echo $num
}

echo "fibo_iter $1: $(fibo_iter $1)"

echo "factorial_iter $1: $(factorial_iter $1)"

exit 0
