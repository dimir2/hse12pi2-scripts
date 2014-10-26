#!/bin/bash

source mathlib.sh

function usehelp {
  echo  "usage: math.sh [fib|factorial|prime|fib_rec] [number]"
  }
case $1 in
 fib) fib $2;;
factorial) factorial $2;;
prime) prime $2;;
fib_rec) fib_rec $2;;
*) usehelp;;
esac
exit 0

