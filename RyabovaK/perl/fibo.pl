#!/usr/bin/perl
use 5.008;
use strict;
use warnings;


sub funFib
{
	my $n = $_[0];
	my $s = 0;
	if ($n < 3 )
	{
		return 1;
	}
	else
	{
		$s = funFib($n - 1) + funFib($n - 2);
		return $s;
	}
}


print funFib (shift);