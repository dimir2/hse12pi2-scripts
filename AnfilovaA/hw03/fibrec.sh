#!/bin/bash

function fibrec 
{
	if [ $1 -lt 2 ]
		then echo $1
	else
		echo $(( $(fibrec $(( $1 - 1 )) ) + $( fibrec $(( $1 - 2 )) ) ))
	fi
}

echo `fibrec $1`
