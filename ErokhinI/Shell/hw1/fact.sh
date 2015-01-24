#! /bin/bash

fact()
{
  	local number=$1

   	if [ "$number" -eq 0 ] 
	then
		factorial=1 
	else
		let "n = number - 1"
		fact $n
		let "factorial = $number * $?" 
	fi

	return $factorial

}

fact $1
echo $?
