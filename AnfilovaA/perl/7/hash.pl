#!/usr/bin/perl

use warnings;
use 5.010;
use Data::Dumper qw(Dumper);

%input = (
11 => 'november',
1 => 'january',
8 => 'august',
4 => 'april',
7 => 'july',
2 => 'february',
5 => 'may',
12 => 'december',
6 => 'june',
3 => 'march',
10 => 'october',
9 => 'september'
	);

print Dumper ( \%input);
@mylist = ();

foreach $key (sort { $a <=> $b } keys %input) {   
     @mylist = (@mylist, ["$key","$input{$key}"]);
}

print Dumper (@mylist);

  

