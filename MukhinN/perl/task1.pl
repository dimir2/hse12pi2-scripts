#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

sub factorial {
	my $number = $_[0];
	if ($number == 0) {
		return 1;
	} else {
		return $number*factorial($number-1);
	}
}

sub fibonacci {
	my $number = $_[0];
	return $number if $number < 2;
	return fibonacci($number - 1) + fibonacci($number - 2);
 }

my $fact = factorial($ARGV[0]);
my $fib = fibonacci($ARGV[1]);

say "fact = $fact";
say "fib = $fib";
