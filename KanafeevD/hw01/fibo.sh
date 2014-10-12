#!/bin/bash
# Script fibo V.0.1

pCounter=0
pFib1=0
pFib2=1
pFibT=0

if [ "$1" -lt  0 ] ; then
	red='\e[0;31m'
	green='\e[0;32m'
	noColor='\e[0m' 
	echo -e "${red}Error! Param less than 0${noColor}"
	echo -e "${green}In math terms, the sequence Fn of Fibonacci numbers is defined by the recurrence relation:"
	echo -e "F(n)=F(n-1)+F(n-2)"
	echo -e "there n is NATURAL (0,1,...,n,...) and F(1)=1 and F(0)=0${noColor}"
	exit 1
fi

while [ "$1" -gt  "$pCounter" ] ; do
	pFibT=$pFib2
	pFib2=$(($pFib1+$pFib2))
	pFib1=$pFibT
	pCounter=$(($pCounter+1))
done

echo "result $pFib1"
echo "End fibo"
exit 0
