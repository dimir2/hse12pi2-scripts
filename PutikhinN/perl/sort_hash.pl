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

my @pairs = make_sorted_pairs(\%what_when);
say Dumper \@pairs;

sub make_sorted_pairs {
	my $hashes = $_[0];
	my $pairs = [];
	my @keys = sort { $a <=> $b } keys %$hashes;
	for my $key_i (0 .. $#keys) {
		my $key = $keys[$key_i];
		$pairs->[$key_i]->[0] = $key;
		$pairs->[$key_i]->[1] = $hashes->{$key};
	}
	return @$pairs;
}
