#!/usr/bin/perl

$fact = 1;

for($i = 1; $i<=$ARGV[0]; $i++)
{
	$fact = $fact*$i;
}

print $fact;
print "\n";
