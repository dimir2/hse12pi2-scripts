#!/bin/bash


sortirovka()
{
prov=$2
k=$1
i=$3
if [[ $prov -gt $i ]]
	then
	return
fi
if [[ $i -eq 1 ]]
	then
	echo "ALL - ${ARR[*]}"
	return
fi
for j in `seq $prov $i`; do
	if [[ ${ARR[$j]} -gt ${ARR[$k]} ]]
		then	
		local tmp=${ARR[$k]}
		ARR[$k]=${ARR[$j]}
		ARR[$j]=$tmp
	fi
done
(( ++prov ))
(( ++k ))
sortirovka $k $prov $i
	
}


guick()
{
	k=$1
	j=$2
	kandj=$(( ($1+$2)/2 ))
	x=${ARR[$kandj]}
	while [[ $k -le $j ]]
		do
		while [[ ${ARR[$k]} -lt $x ]] 
			do
			(( ++k ))
			done
		while [[ ${ARR[$j]} -gt $x ]] 
			do 
			(( --j ))
		done
		if [[ $k -le $j ]]; then
			if [[ ${ARR[$k]} -gt ${ARR[$j]} ]]
				then
				local tmp=${ARR[$k]}
				ARR[$k]=${ARR[$j]}
				ARR[$j]=$tmp
			fi
			(( ++k ))
			(( --l ))
		fi
		done
	if [[ $k -lt $2 ]]
		then
		guick $k $2
	fi
	if [[ $1 -lt $j ]]
		then
		guick $1 $j
	fi
echo "ALL - ${ARR[*]}"
}

echo "Name: $0"
echo "Input filename - enter 0"
echo "Using default filename - enter 1"
read index
case "$index" in
	0) echo "Input filename:"
	   read file;;
	1) file="data.txt";;
	*) echo err;;
esac
echo $file
i=0
while read line; 
	do
	ARR[$i]="$line"
	i=$(($i+1))
done < $file
let ii=i-1
echo "ALL - ${ARR[*]}"
sortirovka 0 1 $i
#guick 0 $i-1	
echo "ALL - ${ARR[*]}"

exit 0

