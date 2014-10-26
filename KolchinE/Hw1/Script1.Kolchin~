#!/bin/bash

function fibonacci {
echo "Enter a number:"
read y

if [ $y -lt 0 ] ; then
echo "Wrong number!"
fibonacci {}
exit 0;
fi

if [ $y -eq 0 ] ; then
echo "Fibonacci= 0"
main {}
fi

if [ $y -eq 1 ] ; then
echo "Fibonacci= 1"
main {}
fi

fib1=1
fib2=1
z=2

while [ $z -lt $y ] ; do
fibonacci=$[$fib1 + $fib2]
fib1=$fib2
fib2=$fibonacci
z=$[$z + 1]
done

echo "Fibonacci=" $fibonacci
main {}

}

function factorial {

echo "Enter a number:"
read x

if [ $x -lt 0 ] ; then
echo "Wrong number!"
factorial {}
exit 0;
fi

z=1
factorial=1

if [ $x -eq 0 ] ; then
echo "Factorial= 1"
main {}
fi 

while [ $z -ne $x ] ; do
f=$[$z + 1]
factorial=$[$factorial * $f]
z=$[$z + 1]
done

echo "Factorial=" $factorial
main {}
}

function main {

echo "What are you going to count?"
echo "1.Factorial"
echo "2.Fibonacci"
echo "3.Exit"

read number
case $number in 
1) factorial {};;
2) fibonacci {};;
3) exit 0;;
esac
}

main {}



 
