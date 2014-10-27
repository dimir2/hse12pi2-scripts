#!/bin/bash

#echo "Hello, world!"

function factorial 
{
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

echo "factorial " $1 "=" `factorial $1`
echo "fibonacci number $1 =" `fibonacci $1`
