#!/bin/bash
# Script starter V.0.1

#params
pFunc=0
pNum=0

#path to script
pScriptFibo="./hw01/fibo.sh"
pScriptFact="./hw01/fact.sh"

# read param
while getopts s:n:q optname > /dev/null 2>&1; do
	case  "$optname" in
		s)
        		pFunc="$OPTARG"
			;;
		n)
        		pNum="$OPTARG"
			;;
		*)
       			echo Unknown option 1>&2
	        	exit 1
			;;
	esac
done
shift `expr $OPTIND - 1`


# check param num
if [ $# -ne 4 ] & [ -z "$pNum" ] & [ -z "$pFunc" ] ; then
	echo "# Usage -s <> -n <>"
	exit 0
fi


# start script
case $pFunc in 
	fibo)
		echo "Start fibo..."
		$pScriptFibo $pNum
		exit 0
		;;
	fact)
		echo "Start fact..."
		$pScriptFact "$pNum"
		exit 0
		;;
	*)
		echo "Not found!"
		exit 1
		;;
esac

# end script starter