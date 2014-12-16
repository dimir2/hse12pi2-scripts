#!/bin/bash

array=0
function readFromFile
{
	index=0
	while read line 
	do
	    	array[$index]="$line"
	    	(( index++ ))
	done < $1
}

function printArray
{
	for ((a=0; a < ${#array[*]}; a++))
	do
    		echo "$a: ${array[$a]}"
	done
}

function bubleSort
{
	arrayLength=${#array[@]}
	for i in `seq 0 $((arrayLength-1))`
	do
		for j in `seq 0 $(( arrayLength-i-2))`
		do
			if [ ${array[j]} -gt ${array[((j+1))]} ]
			then
				temp=${array[j]}
				array[j]=${array[((j+1))]}
				array[(( j + 1 ))]=$temp
			fi
		done
	done
}

function printToFile
{
	for a in `seq 0 ${#array[@]}`
	do
    		echo "${array[$a]}" >> $1
	done
}

readFromFile $1
printArray
bubleSort
printToFile $2
