#!/usr/bin/perl

use Data::Dumper qw(Dumper);

for($i = 0; $i<=100; $i++)
{
	$arr[$i]=int(rand(51))+21;
}

print Dumper(\@arr);

sub QuickSort
{
	my($s, $e) = @_;
    	my $m = $s - 1;
    	for($s..$e - 1)
	{
		if($arr[$_] lt $arr[$e])
		{
	    		++$m;
	    		($arr[$m], $arr[$_]) = ($arr[$_], $arr[$m]);
		}
    	}
    	++$m;
    	($arr[$m], $arr[$e]) = ($arr[$e], $arr[$m]);
    	QuickSort($s, $m-1) if $s < $m-1;
    	QuickSort($m+1, $e) if $m+1 < $e;
}
QuickSort(0, $#arr);

print Dumper(\@arr);
