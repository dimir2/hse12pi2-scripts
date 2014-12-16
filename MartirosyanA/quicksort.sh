#!/bin/bash
function qsort
{
left=$1 #i
right=$2 #j
let "a = ($left + $right)/2"
x=${arr[$a]}
while [ "$left" -le "$right" ]
	do
		while [ " ${arr[$left]} " -lt $x ]
		do
			let "left = $left + 1"
		done
		
	    while [ " ${arr[$right]} " -gt $x ]
		 do
			let "right = $right - 1"
		 done
		
	if [ "$left" -le "$right" ]
		then
			if [ " ${arr[$left]} " -gt " ${arr[$right]} " ]
				then
					tmp=${arr[$left]}
					arr[$left]=${arr[$right]}
					arr[$right]=$tmp
			fi
		let "left = $left + 1"
		let "right = $right - 1"
		fi
		done
	 if [ "$left" -lt "$2" ]
	    then
	     qsort $left $2
     fi
		
		if [ "$1" -lt "$right" ]
			then
				qsort $1 $right
		 fi

		
		}

function main 
{
echo -e "Please enter the name of the file"
  read filename
  if ! [ -f $filename ] ; then
    echo "File does not exist"
    exit 0
  fi
for line in $(cat $filename)
do
let " lengh=$lengh+1"
done
  arr=( `cat $filename ` ) 
  echo -e "Ur massiv is:\n${arr[@]}"
let "a=$lengh-1"
qsort 0 $a

echo -e "after qsort:\n${arr[@]}"
}

main

