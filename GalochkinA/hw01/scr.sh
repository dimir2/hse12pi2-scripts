#!/bin/bash/
function factorial {
    m=1
	for i in `seq 1 $1`
	do
		m=`expr $m \* $i`
		echo -n "$m "
	done
	echo " "

}

function fib {
a=0
b=1
 
for (( n=1; $n<=$1; $((n++)) )); do
  a=$(($a + $b))
  echo -n "$a "
  b=$(($a - $b))
done
echo " "
}

case $1 in
 fib) fib $2;;
factorial) factorial $2;;
*) ;;
esac
exit 0
