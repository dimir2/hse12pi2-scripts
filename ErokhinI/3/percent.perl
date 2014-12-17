#!/usr/bin/perl

$sum = 0;

#print scalar @ARGV;

foreach $i (@ARGV)
{
	$sum = $sum + $i;
}

$sto = 100;
$flag = 0;

foreach $i (@ARGV)
{
	$flag++;
	$n = $i/$sum*100;
	$sto = $sto - sprintf("%.2f", $n);

	if($flag == scalar @ARGV)
	{
		$n = $n + $sto;
	}
	printf("%.2f", $n);
	print "%,";
}

print "\n";
