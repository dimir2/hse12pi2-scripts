#!/bin/bash -x
a1=fibfabprim1.sh ; source "$a1" ;
if [ $? -ne 0 ] ; then echo "error" 1>&2 ; exit 1 ; fi 
case "$1" in
fib) fib $2;;
fac) fac $2;;
prime) prime $2;;
*) echo err;;
esac