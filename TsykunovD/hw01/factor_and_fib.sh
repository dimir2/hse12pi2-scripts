#!/bin/bash

function fibonachi {
  fib1=1
  fib2=1
  echo "Введите число"
  read count
  i=2
  if [ $count -lt 0 ]
  then
    echo "Вы ввели неправильное значение"
    return 0
  fi
  if [ $count -eq 0 -o $count -eq 1 ]
  then
    echo "Число фибоначи от $count = $fib1"
    return 0
  fi
  fibsum=0
  while [ $i -lt $count ]
  do
    fibsum=$[$fib1+$fib2]
    fib1=$fib2
    fib2=$fibsum
    i=$[$i+1]
  done
  echo "Число фибоначи от $count = $fibsum"
}

function factorial {
  if [ $1 -lt 0 ]
  then
    return 1
  fi
  if [ $1 -eq 0 ]
  then
    return 1
  else
    factorial $[$1-1]
    return $[$1*$?]
  fi
}

function main {
  fibonachi
  echo "Введите число для факториала"
  read countfact
  if [ $countfact -lt 0 ]
  then
    echo "Вы ввели неправильное значение"
    return 0
  fi
  echo "Вы ввели $countfact"
  factorial $countfact
  echo "Факториал от числа $countfact = $?"
}



main
