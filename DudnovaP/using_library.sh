#!/bin/bash
source library.sh
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

if [ $var -eq 0 ]; then
	echo "results"
	echo 0
	echo "haven't got factorial"
	echo "Difficult number"
elif [ $var -eq 1 ]; then
	echo "results"
	echo 1
	echo 1
	echo "Difficult number"
elif [ $var -eq 2 ]; then
	echo "results"
	echo 1
	echo 2
	echo "Simple number"
else
	echo "results:"
	fib $var
	fac $var
	simple $var
fi

exit 0
