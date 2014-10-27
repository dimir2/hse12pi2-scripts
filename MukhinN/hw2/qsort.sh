#!/bin/bash -x

function rand
{
	number=-1
	low=$1
	high=$[$2+1]
	while [ $number -lt $low ]
	do
		number=$RANDOM
		number=$[$number%$high]
	done
	echo $number
}

function qSortRec
{
	l=$1
	r=$2
	midIndex=$[$[$1+$2] / 2]
	midNum=${arr[$midIndex]}

	while [ $l -le $r ]; do
		while [ ${arr[$l]} -lt $midNum ]; do
			l=$[$l+1]
			if [ $l -eq $[${#arr[@]}-1] ]
				then break
			fi
		done
		while [ ${arr[$r]} -gt $midNum ]; do
			r=$[$r-1]
		done
		if [ $l -le $r ]
			then tmp=${arr[$l]}
			arr[$l]=${arr[$r]}
			arr[$r]=$tmp
			l=$[$l+1]
			r=$[$r-1]
		fi
	done

	if [ $l -lt $2 ]
		then qSortRec $l $2
	fi
	if [ $1 -lt $r ]
		then qSortRec $1 $r
	fi
}

function qSort
{
	qSortRec 0 $[${#arr[@]}-1]
}

function bublSort
{
	size=${#arr[@]}
	for ((j=0; $j < $[$size-1]; j=$[$j+1]));
	do
		for ((i=0; $i < $[$size-j-1]; i=$[$i+1]));
		do
			if [ ${arr[$i]} -gt ${arr[$[$i+1]]} ]
				then tmp=${arr[i]}
				arr[$i]=${arr[$[$i+1]]}
				arr[$[$i+1]]=$tmp
			fi
		done
	done
}

function main
{
	declare -a arr
	i=0
	while read line
	do
		arr[i]=$line
#		arr[i]=$(rand 0 10)
		i=$[i+1]
	done < mass

	echo ${!arr[@]}
	echo ${arr[@]}

	qSort
#	bublSort

	echo ${!arr[@]}
	echo ${arr[@]}	
}

main

