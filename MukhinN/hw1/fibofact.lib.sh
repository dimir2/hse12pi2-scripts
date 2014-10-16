#!/bin/bash

echo "Loaded fibofact.lib.sh"

function private_fibo_rec
{
	if [ $1 -le 0 ]
		then echo 0
	elif [ $1 -eq 1 ]
		then echo 1
	else
		echo $[ $(private_fibo_rec $[$1-1]) + $(private_fibo_rec $[$1-2]) ]
	fi
}


function fibo
{
	if [ $# -eq 1 ]
		then if [ $1 -ge 0 ]
			then echo "fibo $1: $(private_fibo_rec $1)"
			return 0
		fi
	fi
	echo "Please repeat: fibo [int >= 0]"
	return 1
}

function private_factorial_rec 
{ 
	if [ $1 -lt 2 ]
	then
		echo 1
	else
		echo $[ $1 * $(private_factorial_rec $[$1-1]) ]
	fi
}

function factorial
{
	if [ $# -eq 1 ]
		then if [ $1 -ge 0 ]
			then echo "factorial $1: $(private_factorial_rec $1)"
			return 0
		fi
	fi
	echo "Please repeat: factorial [int >= 0]"
	return 1
}

# Был нужен для одного Алгоритма определения простого числа...
#function exp
#{
#	if [ $2 -eq 0 ]
#		then echo 1
#	else
#		tmp=$(exp $1 $[$2-1])
#		tmp=$[ $1 * $tmp ]
#		echo $tmp
#	fi
#}

function private_simple_num2
{
	for i in `seq 2 $[$1-1]`
	do
		tmp=$[ $1 % $i ]
		if [ $tmp -eq 0 ]
			then echo "not simple"
			return 1
		fi
	done
	echo "simple"
	return 0		
}

function private_simple_num
{
	if [ $1 -eq 1 ]
		then echo "simple"
	else
		tmp=$(private_factorial_rec $[$1-1])
		echo "fact $[$1-1]: $tmp"
		tmp=$[$tmp+1]
		tmp=$[$tmp%$1]

		if [ $tmp -eq 0 ]
			then echo "simple"
		else
			echo "not simple"
		fi
	fi
}

function simple_num
{
	if [ $# -eq 1 ]
		then if [ $1 -gt 0 ]
			then echo "simple_num $1: $(private_simple_num $1)"
#			then echo "simple_num $1: $(private_simple_num2 $1)"
			return 0
		fi
	fi
	echo "Please repeat: simple_num [int > 0]"
	return 1
}

