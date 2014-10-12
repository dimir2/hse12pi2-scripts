#!/bin/bash
# Script starter V.0.1

#params
pFunc=0
pNum=0

#path to script
pScriptFibo="./hw01/fibo.sh"
pScriptFact="./hw01/fact.sh"

# check param num
if [ $# -ne 4 ] ; then
	echo "# Usage -s <> -n <>"
	exit
fi

# read param
while getopts s:n optname > /dev/null 2>&1; do
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

# start script
case $pFunc in 
	fibo)
		echo "Start fibo..."
		sh $pScriptFibo
		exit
		;;
	fact)
		echo "Start fact..."
		sh $pScriptFact
		exit
		;;
	*)
		echo "Not found!"
		exit
		;;
esac

# end script starter