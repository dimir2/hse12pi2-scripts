#!/bin/bash

source mathlib.sh

function usehelp {
  echo  "usage: math.sh [fib|factoial|prime] [number]"
  }
case $1 in
 fib) fib $2;;
factorial) factorial $2;;
prime) prime $2;;
*) usehelp;;
esac
exit 0

