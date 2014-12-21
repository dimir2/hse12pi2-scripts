#!/usr/bin/perl
use 5.008;
use strict;
use warnings;

sub funFact {
    my $t = 0;
	my $n = shift;
    if ($n==0) {
        return 1;
    } 
	else
	{
		$t = $n*funFact($n-1);
        return $t;
    }
}
print funFact(shift);