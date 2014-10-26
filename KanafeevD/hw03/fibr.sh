#!bin/bash

function fibRec()
{
	if [ $1 -lt 1 ]
	then
		echo "Err, param lower than 1"
		return 1
	elif [ "$1" -eq 2 ] ; then
		echo 1
	elif [ "$1" -eq 1 ] ; then
		echo 1
	else
		echo  "$(fibRec $(( $1 - 1 )))+$(fibRec $(( $1 - 2 )))" | bc
	fi
}


# Not stable!
# Be careful with file fib_num.txt
# If script work incorrectly, try to delete fib_num.txt
function fibRecOpt()
{
	if [ $1 -lt 1 ]
	then
		echo "Err, param lower than 1"
		return 1
	elif [ ! -f "hw03/fib_num.txt" ]
	then
  		echo "1" > hw03/fib_num.txt
  		echo "1" >> hw03/fib_num.txt
	fi

	i=0
	while read line	
	do
		i=`expr $i + 1`
		if [ $i -eq $1 ]
			then
			echo "$line"
			return
		fi
	done < hw03/fib_num.txt

	fOne=$(fibRecOpt $(( $1 - 2 )))
	fTwo=$(fibRecOpt $(( $1 - 1 )))

	echo "$fOne+$fTwo" | bc >> hw03/fib_num.txt
	echo "$fOne+$fTwo" | bc
}

