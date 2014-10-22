function factorial {
in='^\-?[0-9]*$'
  if ! [[ $1 =~ $in ]] ; then
    echo "Error is not a number"
    return
  fi
  nm='^\-[0-9]*$' #отриц числа
  if  [[ $1 =~ $nm ]] ; then
    echo "Error the number is negative"
    return
  fi
    m=1
	for i in `seq 1 $1`
	do
		m=`expr $m \* $i`
		echo -n "$m "
	done
	echo " "

}

function fib {
in='^\-?[0-9]*$'
  if ! [[ $1 =~ $in ]] ; then
    echo "Error is not a number"
    return
  fi
  nm='^\-[0-9]*$' #отриц числа
  if  [[ $1 =~ $nm ]] ; then
    echo "Error the number is negative"
    return
  fi
a=0
b=1
 
for (( n=1; $n<=$1; $((n++)) )); do
  a=$(($a + $b))
  echo -n "$a "
  b=$(($a - $b))
done
echo " "
}

function prime {
  in='^\-?[0-9]*$'
  if ! [[ $1 =~ $in ]] ; then
    echo "Error is not a number"
    return
  fi
  nm='^\-[0-9]*$' #отриц числа
  if  [[ $1 =~ $nm ]] ; then
    echo "Error the number is negative"
    return
  fi
  if [[ $1 -eq 0 ]] || [[ $1 -eq 1 ]] ; then
    echo "$1 - not simple."
    return
  fi
  tr=$(( $1 / 2 ))
  i=2
  flag=0

  while [ $i -le $tr ] ; do 
    rt=$(( $1 % $i ))

    if [[ $rt -eq 0 ]] ; then 
      flag=1
      break
    fi

    i=$(( $i + 1 ))

  done
  if [[ $flag -eq 0 ]] ; then
    echo "$1 - simle"
  else
    echo "$1 - not simple."
  fi
}

