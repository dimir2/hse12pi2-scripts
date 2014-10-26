#!bin/bash
# 2. Реализвать один из рекурсивных алгоритмов сортировки 
# 2.1 Данные для скрипта (список чисел) - читать из файла (одна строка - одно число)
# 2.2 Загружать данные в массив

# Dont work now
declare -a mass

function sort()
{
	declare -a mass
	length=$(readMass mass)
	echo $length
	echo -e "Array = ${mass[@]}"
	recSort mass
}

 function readMass ()
{
	length=0	
	while read line	
	do
		mass[$length]=$line
		length=`expr $length + 1`
	done < hw03/mass.txt
	echo "Array = ${mass[@]}"
	echo $length
}

function recSort()
{
	echo TODO
}
