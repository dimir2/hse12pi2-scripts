#!/usr/bin/env perl
use 5.008;
use strict;
use warnings;

my %hash = (
13 => 'Lunch',
17 => 'Tea',
20 => 'Dinner',
9 => 'Breakfast',
);


foreach my $key(sort {$hash{$a} cmp $hash{$b}} keys %hash)
{
print "$key => $hash{$key}\n";
}

