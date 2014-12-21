#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Data::Dumper qw(Dumper);


print Dumper(\@ARGV);
my $kolvo = @ARGV;
print $kolvo;
my $var = 0;
for(my $i=0; $i<=$kolvo; $i++)
{
	$var+= $ARGV[$i];
}
my $n = 100/$var;

my @arr;
my $summa = 0;
for(my $j=0; $j<=$kolvo-1; $j++)
{
	$arr[$j] = sprintf('%.1f',$n*$ARGV[$j]);
	$summa+= $arr[$j];
	
}

print Dumper(\@arr);
print "summa= $summa %\n";
if($summa ne 100)
{
	my $new_sum = $summa-100;
	$arr[-1]-= $new_sum;
 	print Dumper(\@arr);
	$summa=0;
	for(my $j=0; $j<=$kolvo-1; $j++)
	{
		$summa+= $arr[$j];
	
	}
	print "summa= $summa %\n";
}
