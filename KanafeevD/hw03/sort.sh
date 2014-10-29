#!/bin/bash
# 2. Реализвать один из рекурсивных алгоритмов сортировки 
# 2.1 Данные для скрипта (список чисел) - читать из файла (одна строка - одно число)
# 2.2 Загружать данные в массив

printnumbers()
{
   echo ${ARRAY[*]}
}

qsort()
{
    local array=( `echo "$@"` )
    local -a lower
    local -a great
    local -a equal
    local el=

    if [ ${#array[@]} -eq 0 ]; then
     	echo 
     elif [ ${#array[@]} -eq 1 ]; then
     	echo -n " [${array[@]}] "
    else
        local ref=${array[0]}

        for el in ${array[@]}
        do
	          if [ $el -lt $ref ]
	          then
			q=${#lower[@]}
	              	lower[$q]=$el 
	          elif [ $el -gt $ref ]
	          then
			q=${#great[@]}
	              	great[$q]=$el 
	          else
			q=${#equal[@]}
              		equal[$q]=$el 
        fi
        done
      echo "`qsort "${lower[@]}"` [${equal[@]}] `qsort "${great[@]}"`"
    fi
}

#####################################################################

while read line
do
	ARRAY=(${ARRAY[@]} $line)
done < $1

count=${#ARRAY[@]}

#####################################################################

echo "--------------------------------------------------------------"

echo "Numbers Before Sort:"

printnumbers

echo "Numbers After Sort: "

qsort "${ARRAY[@]}"

echo "--------------------------------------------------------------"
