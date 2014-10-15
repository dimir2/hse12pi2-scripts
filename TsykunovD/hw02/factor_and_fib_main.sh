#!/bin/bash

source factor_and_fib.lib

function main {
  a=$(date)
  echo -e "Привет мой милый друг.\nСегодня $a.\nПрогрмма считает число фибоначи и факториал.\nA так же делает проверку на простоту числа!"
  echo "Введите число для подсчёта фибоначи"
  read fibcount
  fibonachi $fibcount
  echo "Введите число для факториала"
  read countfact
  factorial $countfact
  echo "Введите число для проверки числа на простоту"
  read isprimecount
  IsPrime $isprimecount
  echo -e "Спасибо, что воспользовались моей программой.\nС вами был Ваш любимый Компьютер!"
}



main
