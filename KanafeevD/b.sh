#!/bin/bash
# Script starter V.0.3
# TODO:
# 1. Check param on string -DONE!
# 2. Lib - DONE!
# 3. Usage - DONE!
# 4. Simple num


function usage ()
{
	echo "#"
	echo "# Usage -s <script_name> -n <integer_num> -c <string>"
	echo "#"
	echo "# Scripts for integer number ( -n ):"
	echo "#--------------|---------------------|------------------------------------------"
	echo "# Script name  | Action              |-n Param								"
	echo "#--------------|---------------------|------------------------------------------"
	echo "# fibo         | calc fibonacci      | integer, must be possitive or zero"
	echo "# fact         | calc factorial      | integer, must be possitive or zero"
	echo "# pnum         | check is num prime  | integer				"
	echo "# fibr         | calc rec fibonacci  | integer, must be possitive or zero"
	echo "# fibs         | calc rec opt fib    | integer, must be possitive or zero"
	echo "#-------------------------------------------------------------------------------"
	echo "#"
	echo "# Scripts for string ( -c ):"
	echo "#--------------|---------------------|------------------------------------------"
	echo "# Script name  | Action              |-c Param								"
	echo "#--------------|---------------------|------------------------------------------"
	echo "# ****************************There are no scripts!*****************************"
	echo "#-------------------------------------------------------------------------------"
	echo "#TODO: add new func in table"
	return
}

#params
pFunc=0
pNum=0
pString=""

# check param num
if [ $# -ne 4 ] ; then
	usage
	exit 0
fi

# read param
while getopts s:n:c:h optname > /dev/null 2>&1; do
	case  "$optname" in
		s)
        		pFunc="$OPTARG"
			;;
		n)
        		pNum="$OPTARG"
			;;
		c)
        		pString="$OPTARG"
			;;
		h)
			usage
			exit 0        			
			;;
		*)
       			echo Unknown option 1>&2
	        	exit 1
			;;
	esac
done
shift `expr $OPTIND - 1`

#check param int/string
if [ "$pNum" -eq "$pNum" ] 2>/dev/null
then :
#    echo "$pNum is an integer !!"
else
    echo "ERROR: -n parameter must be an integer."
    usage
    exit 1
fi

# start script
case $pFunc in 
	fibo)
		source hw01/fibo.sh
          	fibo $pNum
		exit 0
		;;
	fact)
		source hw01/fact.sh
		fact $pNum 
		exit 0
		;;
	pnum)
		source hw02/pnum.sh
		pnum $pNum 
		exit 0
		;;
	fibr)
		source hw03/fibr.sh
		echo $(fibRec $pNum)
		exit 0
		;;
	fibs)
		source hw03/fibr.sh
		echo $(fibRecOpt $pNum)
		exit 0
		;;
	sort)
		#source hw03/sort.sh
		./hw03/sort.sh $pString
		exit 0
		;;
	*)
		echo "Script is not found! Pls, read help:  b.sh -h "
		exit 1
		;;
esac

# end script starter