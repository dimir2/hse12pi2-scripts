#!/bin/bash

function quicksort { #mass first last
  local tempx=$(( ($2+$3)/2 ))
  local x=${array[$tempx]}
  local i=$2
  local j=$3
  while [[ $i -le $j ]] ; do
    while [[ ${array[$i]} -lt $x ]] && [[ ${#array[@]} -gt $i ]] ; do  ((i++)) ; done ; 
    while [[ ${array[$j]} -gt $x ]] && [[ 0 -le $j ]] ; do  ((j--)) ; done ; # 
    if [[ $i -le $j ]] ; then
      if [[ ${array[$i]} -gt ${array[$j]} ]] ; then
        tmp=${array[$i]}
        array[$i]=${array[$j]}
        array[$j]=$tmp 
        #echo ${array[@]} 
      fi
    ((i++))
    ((j--))
    fi
  done
  if [[ $i -lt $3 ]] ; then
    quicksort 0 $i $3
  fi
  if [[ $2 -lt $j ]] ; then
    quicksort 0 $2 $j
  fi
}

function main {
  echo -e "Добро пожаловать в программу квуиксорт\nВведите имя файла из которого вы хотите прочитать массив:"
  read filename
  if ! [ -f $filename ] ; then
    echo "Такого файла не существует!"
    exit 0
  fi
  count=0
  while read num
  do
    array[$count]=$num
    ((count++))
  done < <(cat $filename | grep -E '^\-?[0-9]+$')
  #array=( `cat $filename ` ) #--extended-regexp #| grep -E '\-?[0-9]+'
  echo -e "Вы ввели массив:\n${array[@]}"
  quicksort 0 0  $((${#array[@]}-1)) #mass first last
  echo -e "После куиксорта:\n${array[@]}"
}



main
