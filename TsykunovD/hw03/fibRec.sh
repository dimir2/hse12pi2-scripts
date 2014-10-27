#!/bin/bash


function fibrec {
  if [[ $1 -le 0 ]] ; then 
    echo 0
    return
  fi
  if [[ $1 -eq 1 ]] || [[ $1 -eq 2 ]] ; then
    echo 1
    return
  fi
  echo $(( $(fibrec $(( $1 - 1 )) ) + $(fibrec $(( $1 - 2 )) ) ))
}

function main {
  
  echo -e "Это фибоначи с помощю рекурсии\nВведите число для подсчёта фибоначи:"
  read count
  re='^\-?[0-9]*$'  #Минус может быть, а может и нет и любые числа
  if ! [[ $count =~ $re ]] ; then
    echo "Ошибка: Вы ввели не число"
    return
  fi
  im='^\-[0-9]*$' #отриц числа
  if  [[ $count =~ $im ]] ; then
    echo "Вы ввели отрицательное значение"
    return
  fi
  echo "Фибоначи от $count = $(fibrec $count)"
  #a=0 ; while [[ $a -le 100 ]] ; do  arr[$a]=0 ; a=$(( $a + 1 )) ; done ;
}



main
