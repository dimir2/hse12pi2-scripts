#!/bin/bash

#echo "Hello, world!"

function factorial 
{
	$(isNonNegativeNumber $1) && echo "argument is not nonnegative number" && return 1
	res=1
	n=1
	while [ $1 -ge $n ]
	do  
     	   res=$(($res*n))
	   n=$(($n+1))
	done
	echo $res
}


function fibonacci
{
	$(isPositiveNumber $1) && echo "argument is not positive number" && return 1
	res=1
	fib2=1
	n=1
	if [ $1 -eq 1 ] || [ $1 -eq 2 ]
	   then echo 1
	   return
	fi
	for i in `seq 3 $1`
	do
	   temp=$res
	   res=$(( $res + $fib2 ))	   
	   fib2=$temp
	   
	done
echo $res
}

function isPrime
{
# 1 - prime
# 0 - not prime
	$(isNonNegativeNumber $1) && echo "argument is not nonnegative number" && return 1
	if [ $1 -eq 2 ] 
	     then
	     echo "prime"
	     return
	elif [ $1 -le 1 ] || [ $(( $1 % 2 )) -eq 0 ]
	     then 
	     echo "not prime"
	     return
	else
	     sqrt=$(echo "sqrt ( $1 )" | bc -l)
	     count=3
             while [ $count -lt $1 ]
	     do
       		if [ $(( $1 % $count )) -eq 0 ] 
		     then
		     echo "not prime"
		     return 0
	        else count=$(( $count + 1 ))
	        fi
             done
	     echo "prime"
	     return
	fi
}

function isPositiveNumber
{
	if [[ $1 =~ ^[1-9][0-9]*$ ]]
	    then
	    	return 1
	    else 
	    	return 0 
	fi	
}

function isNonNegativeNumber
{
	if [[ $1 =~ ^0$ ]] || [[ $1 =~ ^[1-9][0-9]*$ ]]
	    then
	    	return 1
	    else 
	    	return 0 
	fi	
}




#echo "factorial " $1 "=" `factorial $1`
#echo "fibonacci number $1 =" `fibonacci $1`
#echo " $1   " `isPrime $1`
#echo `isPositiveNumber $1`
