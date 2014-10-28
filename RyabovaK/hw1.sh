#!/bin/bash

echo "Enter the number N:"
read n

max=15

funFact(){
  n=$1
  if [ "$n" -lt 2 ]
  then
    echo "1"
  else
    echo $(($n * $(funFact $(($n-1)))))
  fi
}


funFib(){
   n=$1
   if [ "$n" -lt 3 ]
   then
     echo "1"
   else
     echo $(( $(funFib $(( $n - 1 ))) + $(funFib $(( $n - 2 ))) ))
   fi
}

    fin1=$(funFact $n)
      echo "N!=$fin1 "
    fin2=$(funFib $n)
      echo "Fibonacci=$fin2"

exit
