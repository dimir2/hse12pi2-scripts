#!/bin/bash
echo "Name: $0"
echo "Input number:"
read var

fac()
{
i=1
res=1
while [ $i -le $1 ]
do
let res=res*i
(( ++i ))
done
echo $res
}

fib()
{
number=$1
FIBO[0]=0
FIBO[1]=1
FIBO[2]=1
for j in `seq 3 $number`; do
	let l=j-1
	let k=j-2
	let FIBO[j]=FIBO[l]+FIBO[k]
done
echo "${FIBO[$number]}"
}

if [ $var -eq 0 ]; then
	echo "results"
	echo 0
	echo "haven't got factorial"
else 
	echo "results:"
	fib $var
	fac $var
fi

exit 0
