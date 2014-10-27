#! /bin/bash

fib()
{
	local number=$1

   	if [ "$number" -eq 1 ] || [ "$number" -eq 2 ] 
	then
		fibon=1 
	else
		let "n = number - 1"
		fib $n
		local num=$?
		let "n = number - 2"
		fib $n
		let "fibon = $num + $?" 
	fi

	return $fibon

}

fib $1
echo $?
