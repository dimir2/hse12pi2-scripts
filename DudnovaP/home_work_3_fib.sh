#!/bin/bash

check_number()
{
RE='^0*[1-9][0-9]*$'
if [[ $1 =~ $RE ]]; then
	echo "ok"
	return 23
else
	echo "Error: invalid number"
	helper
fi
}
helper()
{
echo "this script need to take only positiv number from you"
echo "this script need it to give you:"
echo "fibonachi(your number)"
}

fib()
{
number=$1
if [ $number -lt 0 ]; then
	echo 0
	return
elif [ $number -le 2 ]&&[ $number -ge 1 ]; then
	echo 1
	return
else
	(( --number ))
	f1=$( fib $number )
	(( --number ))
	f2=$( fib $number )
	echo $(( f1 + f2 ))
fi
}

checkfield=1
while [ $checkfield -eq 1 ]
do
echo "Name: $0"
echo "Input number:"
read var
check_number $var $checkfield
if [ $? -eq 23 ]; then
(( --checkfield ))
fi
done
for i in `seq 0 $var`; do
	FIBO=$(fib $i)
	echo "$FIBO"
done
exit 0
