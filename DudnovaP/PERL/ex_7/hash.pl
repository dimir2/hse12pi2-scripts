#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my %what_when = (
	13 => 'Lunch',
	17 => 'Tea',
	20 => 'Dinner',
	9 => 'Breakfast',
);
print "@{[%what_when]}\n";
my @result;
map { push @result,[$_, $what_when{$_}]} sort {$a <=> $b} keys %what_when;
for(my $j=0; $j< scalar @result; $j++)
{
	for(my $k=0; $k<=1; $k++)
	{
		print "$result[$j][$k] ";
	}
	say"";
}
