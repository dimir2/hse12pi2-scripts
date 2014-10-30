#!/bin/bash

source numberslib.sh

function main
{  if [ $1 -ge 0 ] 
then
	 echo "fibonacci for this number is: $(fibonacci $1)"
	 echo "factorial for this number is: $(factorial $1)" 
	 echo "if the number is prime? $(isprime $1)"
	 
	for i in $(seq 0 $1) 
	do 
	FIBO=$(fibo_rec $i) 
         echo -n "$FIBO "
	done
else 
echo "please enter number and make it >0!"
return 1
fi
}
main $1
