#!/bin/bash
echo "hi"
function fib {
g=0
k=1
m=0
n=2
if [[ $1 = "1" || $1 = "2" ]]
	then	
	echo "1"
else
	let "l=$1+1"
	while [[ $n != $l ]]
		do
			let "g=m+k"
			let "m=k"
			let "k=g"
			let "n+=1"
		done	
	echo "fibonnacce $1 = $g"
fi
}

function fact {
x=1
b="$1"
	if [[ $b = "1" ]]
		then
		echo "1"
	else 	
		while [[ $b != "1" ]]
		do
			let "x=$b*$x"
			let "b-=1"
		done	
	echo "factorial $1 = $x"
fi
}
case $1 in
 fib) fib $2;;
fact) fact $2;;
*) err;;
esac
exit 0
