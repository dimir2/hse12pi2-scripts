#!/bin/bash

function factorial 
{
result=1

for (( factor=$1 ; $factor ; factor=$factor-1 ))

do

     let -i result=$result*$factor

done

echo $result

}

function fibonacci
 {
a=0

b=1


for (( n=1; "$n"<="$1"; n=$n+1 ));

do

  a=$(($a+$b))

  b=$(($a - $b))

done
echo $a


}

function isprime
{


	if [ "$1" -eq 1 ]

	then
		echo "No! The number is not prime!Sorry!:)"

		return 1

	fi

	

	for(( n=2; n*n<=$1; n++))

	do

		let "a = $1 % $n"

		if [ $a -eq 0 ]

		then

			echo "No! The number is not prime!Sorry!:)"

			return 1

		fi

	done



	echo "Yay the number is prime! "

	return 0

}

function fibo_rec
{
   numbr=$1   
  if [ "$numbr" -lt 2 ]
  then
    echo "$numbr"
  else
    let " a=$numbr-1"
    let " b=$numbr-2 "
    temp1=$( fibo_rec $a)   

    temp2=$( fibo_rec $b)   

    echo $(( temp1 + temp2 ))
  fi
}
