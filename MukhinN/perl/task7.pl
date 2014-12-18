#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Data::Dumper qw(Dumper);

my %what_when = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);

sub func {
	my $arr = $_[0];
	my $exitMass = [];
	my @keys = sort { $a <=> $b } keys %$arr;

	for my $key_i (0 .. $#keys) {
		my $key = $keys[$key_i];
		$exitMass->[$key_i]->[0] = $key;
		$exitMass->[$key_i]->[1] = $arr->{$key};
	}
	return @$exitMass;
}

my @mass = func(\%what_when);

say Dumper \@mass;
