#!/bin/bash
# Script fact V.0.1

 pCounter=0
pFact=1

if [ "$1" -lt  0 ] ; then
	red='\e[0;31m'
	green='\e[0;32m'
	noColor='\e[0m' 
	echo -e "${red}Error! Param less than 0${noColor}"
	echo -e "${green}In mathematics, the factorial of a non-negative integer n, denoted by n!,"
	echo -e "is the product of all POSITIVE integers less than or equal to n.${noColor}"
	exit 1
fi

while  [ "$1" -gt "$pCounter"  ] ; do
	pFact=$(($pCounter * $pFact))
	pCounter=$(($pCounter - 1))
done

echo "Result: $pFact"
echo "End fact"