#! /bin/bash

s=0

while read line
do
	if [ "$line" != "0" ]
	then
		let "a = $line"
		if [ "$a" != "0" ]
		then
			arr[$s]=$line
			let "s = $s + 1"
		fi
	else
		arr[$s]=$line
		let "s = $s + 1"
	fi
done < $1

echo ${arr[@]}

sort()
{
	local i=$1
	local j=$2
	let "a = ($i + $j)/2"
	local x=${arr[$a]}
	#echo ${arr[@]}

	while [ "$i" -le "$j" ]
	do
		while [ " ${arr[$i]} " -lt $x ]	
		do
			let "i = $i + 1"	
		done

		while [ " ${arr[$j]} " -gt $x ]	
		do
			let "j = $j - 1"	
		done

		if [ "$i" -le "$j" ]
		then
			if [ " ${arr[$i]} " -gt " ${arr[$j]} " ]
			then
				tmp=${arr[$i]}
				arr[$i]=${arr[$j]}
				arr[$j]=$tmp
			fi
			let "i = $i + 1"
			let "j = $j - 1"
		fi

		if [ "$i" -lt "$2" ]
		then
			sort $i $2
		fi

		if [ "$1" -lt "$j" ]
		then
			sort $1 $j
		fi
	done

}

sort 0 $s

echo ${arr[@]}
