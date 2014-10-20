#!/bin/bash
# Script prime number  V.0.1

function pnum()
{
	echo "Start pnum..."
	echo "Param $1"

	red='\e[0;31m'
	green='\e[0;32m'
	noColor='\e[0m' 

	i=2

	if [ "$1" -lt 2 ] ; 
	then 
		echo -e "${red}$1 is not primary number!${noColor}"
		return 1
	elif [ "$1" -eq 2 ] ; 
	then 
		echo -e "${green}$1 is primary number!${noColor}"
		return 0
	fi
 
	while  [ $(($i*$i))  -le "$1" ] ; do
		if  [ "$(($1%$i))" -eq 0 ] ; then
			echo -e "${red}$1 is not primary number!${noColor}"
			return 0
		fi
		i=$(($i+1))
	done
	echo -e "${green}$1 is primary number!${noColor}"

	echo "End pnum"

	return 0
}