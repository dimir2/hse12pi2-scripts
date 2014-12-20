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
my $when;
my @schedule;
my @non;
foreach $when (keys %what_when)
{
	push (@non, $when);
}
my @yes = sort {$a <=> $b }
@non;
for(my $j=0; $j<=3; $j++)
{
	my @row = ($what_when{$yes[$j]}, $yes[$j]);
#	say $yes[$j];
	push (@schedule, [@row]);
}
say "Massiv = (";
for(my $j=0; $j<=3; $j++)
{
	print " 	[";
	for(my $k=0; $k<=1; $k++)
	{
		print "$schedule[$j][$k] ";
	}
	say "],";
}
say ");"

