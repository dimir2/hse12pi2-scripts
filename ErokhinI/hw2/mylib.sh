fib()
{
	local number=$1

	if [ "$number" -eq 0 ]
	then
		return 0
	fi

   	if [ "$number" -eq 1 ] #|| [ "$number" -eq 2 ] 
	then
		return 1 
	fi
		
	let "n = number - 1"
	fib $n
	local num=$?
	let "n = number - 2"
	fib $n
	let "fibon = $num + $?" 

	return $fibon

}

fact()
{
  	local number=$1

   	if [ "$number" -eq 0 ] 
	then
		factorial=1 
	else
		let "n = number - 1"
		fact $n
		let "factorial = $number * $?" 
	fi

	return $factorial

}

prime()
{
	if [ "$1" -eq 1 ]
	then
		echo "no"
		return 1
	fi
	
	for(( d=2; d*d<=$1; d++))
	do
		let "a = $1 % $d"
		if [ $a -eq 0 ]
		then
			echo "no"
			return 1
		fi
	done

	echo "yes"
	return 0
}

helps()
{
	echo "********************************************"
	echo "*                                          *"
	echo "*  KEYS:                                   *"
	echo "*                                          *"
	echo "* -help        --> help page               *"
	echo "* -fact [arg]  --> the factorial #[arg]    *"
	echo "* -fib  [arg]  --> fibonachi number #[arg] *"
	echo "* -prime [arg] --> [arg] is Prime?         *"
	echo "*                                          *"
	echo "********************************************"
}
