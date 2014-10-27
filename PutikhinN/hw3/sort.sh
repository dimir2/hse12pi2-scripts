#!/bin/bash

declare -a strArr

function quickSort() {
	_quickSort 0 $((${#strArr[@]}-1))
	echo ${strArr[@]}
}

function _quickSort() {
	declare -i left=$1
	declare -i right=$2
	if [ $left -ge $right ]; then
		return
	fi
	declare -i pivotI=$((RANDOM%(right-left)+left))
	declare -i pivot=${strArr[$pivotI]}

	declare -i leftCtr=$left
	declare -i rightCtr=$right

	while [ $leftCtr -le $rightCtr ]; do
		if [ $leftCtr -ge $right ] || [ $rightCtr -le $left ]; then
			break
		fi
		while [ ${strArr[$leftCtr]} -lt $pivot ]; do
			((++leftCtr))
			if [ $leftCtr -ge $right ]; then
				break
			fi
		done
		while [ ${strArr[$rightCtr]} -gt $pivot ]; do
			((--rightCtr))
			if [ $rightCtr -le $left ]; then
				break
			fi
		done
		if [ $leftCtr -le $rightCtr ]; then
			local tmp=${strArr[$leftCtr]}
			strArr[$leftCtr]=${strArr[$rightCtr]}
			strArr[$rightCtr]=$tmp
			((++leftCtr))
			((--rightCtr))
		fi
	done
	_quickSort $left $rightCtr
	_quickSort $leftCtr $right
}

function sortSort() {
	sort -n $1
}

function validateFile() {
	if [ -r $1 ]; then
		return 0
	else
		echo Error: can\'t read file $1
		return 1
	fi
}

function loadFileToArray() {
	declare -i strCtr=0
	while read str; do
		strArr[$strCtr]=$str
		((++strCtr))
	done < $1
	return 0
}

function printHelp() {
	echo "Usage:
	sort.sh -[quick|sort] FILE 
Arguments:
	-quick	sort FILE using quicksort
	-sort	sort FILE using bash \"sort\" command
	-help	display help and exit"
}

case $1 in
	-quick)
		validateFile $2 && loadFileToArray $2 && quickSort $2;;
	-sort)
		validateFile $2 && sortSort $2;;
	-help) printHelp;;
	*) printHelp;;
esac

exit 0
