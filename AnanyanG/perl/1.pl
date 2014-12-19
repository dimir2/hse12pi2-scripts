#!/usr/bin/perl

use 5.010;
use strict;
use warnings;



if ("fibonacci" =~ /$ARGV[0]/) {
	print_fib($ARGV[1]);
} elsif ("factorial" =~ /$ARGV[0]/) {
	print_fac($ARGV[1]);
} 
sub print_fib {
	my $n = $_[0];
	my $cur = 1;
	my $prev = 1;
	for (3 .. $n) {
		my $t = $cur;
		$cur += $prev;
		$prev = $t;
	}
	say $cur;
	return;
}

sub print_fac {
	my $n = $_[0];
	my $result = 1;
	for my $i ( 2 .. $n) {
		$result *= $i;
	}
	say $result;
	return;
}
