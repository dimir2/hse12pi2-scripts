#!/bin/bash

function bublesort {
local i=0
local mlength=${#atosort[@]}
local j=0
while [[ $i -lt $(( $mlength-1 )) ]] ; do
  j=0
  while [[ $j -lt $(( $mlength-$i-1 )) ]] ; do
    if [[ ${atosort[$j]} -gt ${atosort[$(( $j+1 ))]} ]] ;  then #then swap
      tmp=${atosort[$j]}
      atosort[$j]=${atosort[$(( $j+1 ))]}
      atosort[$(( $j+1 ))]=$tmp
    fi
  #echo ${atosort[@]}
  ((j++))
  done
((i++))
done
}

function main {
  echo -e "Добро пожаловать в программу бублесорт\nВведите имя файла из которого вы хотите прочитать массив:"
  read filename
  if ! [ -f $filename ] ; then
    echo "Такого файла не существует!"
    exit 0
  fi
  atosort=( `cat $filename ` ) #--extended-regexp #| grep -E '\-?[0-9]+'
  echo -e "Вы ввели массив:\n${atosort[@]}"
  bublesort 
  echo -e "После бублесорта:\n${atosort[@]}"
}



main
