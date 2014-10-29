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
echo "results:"
fib $var
fac $var
simple $var
exit 0
