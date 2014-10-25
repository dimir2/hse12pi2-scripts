#!/bin/bash

function getFib() {
	if [ $1 -le 0 ]; then
		echo 0
		return
	fi
	if [ $1 -le 2 ]; then
		echo 1
		return
	fi
	echo $((`getFib $(($1-1))` + `getFib $(($1-2))`)) 
}

declare -a arr; arr=(0 0)
function getFibD() {
	declare -i arg=$1
	if [ $arg -le 0 ]; then
		echo 0
		return
	fi
	if [ $arg -le 2 ]; then
		echo 1
		return
	fi
	test=${arr[@]}
	if [[ ${arr[$arg]} -gt 0 ]]; then
		echo ${arr[$arg]}
		return
	fi
	arr[$1]=$((`getFibD $(($arg-1))` + `getFibD $(($arg-2))`))
	test=${arr[@]}
	echo ${arr[$arg]} 
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
		if [ `expr $1 % $i` -eq 0 ]; then
			echo 0
			return
		fi
		((i+=2))
	done
	echo 1
}
