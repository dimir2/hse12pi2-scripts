#!/usr/bin/perl

#print $ARGV[0];
$priv1 = 0;
$priv2 = 1;

if($ARGV[0]==0)
{
	print 0;
}
if($ARGV[0]==1)
{
	print 1;
}
else
{
	for($i = 1; $i<$ARGV[0]; $i++)
	{
		$fib = $priv1+$priv2;
		$priv1 = $priv2;
		$priv2 = $fib;
	}
	print $fib;
}
print "\n";
