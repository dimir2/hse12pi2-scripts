#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

sub fib {
	my ($input) = @_;

	my $l = 1;
	my $j = 1;
	my $k = 0;
	
	if ($input == 0) {
		$l = $k;
	} elsif ($input == 1) {
		$l = $j;
	} else {
		for (my $i = 2; $i <= $input; $i++) {
			$l = $j + $k;
			$k = $j;
			$j = $l;
		}
	}
	return $l;
}

sub fac {
	my ($input) = @_;

	my $m = 1;
	
	for (my $i = 1; $i <= $input; $i++) {
		$m = $m * $i;
	}
	return $m;
}

say "What Fibonacci number do you want?";
my $input = <>;
if (looks_like_number($input)) {
	say fib($input);
} else {
	say "You are idiot!";
}

say "Input your N!";
$input = <>;
if (looks_like_number($input)) {
	say fac($input);
} else {
	say "You are idiot!";
}
