#! /bin/bash

fib()
{
	num=$1
	if [ "$num" -lt 2 ]
	then
		echo $num
	else 
		let "num = num - 1"
		let "a = $(fib $num)"
		let "num = num -1"
		let "b = $(fib $num)"
		echo $((a+b))
	fi
	return
}

fack()
{
	num=$1
	if [ "$num" -eq 0 ]
	then
		echo 1
	else
		let "num1 = num - 1"
		let "num1 = $(fack $num1)"
		echo $((num*num1))
	fi
	return

}

fib "$1"
fack "$1"
