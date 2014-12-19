#!/usr/bin/perl
use 5.18.2;
use strict;
use warnings;
use utf8; 

binmode(STDOUT,':utf8');
use Data::Dumper qw(Dumper);

my %what_when = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);

my @shedule;
my $j=0; my $i=0;
for  my $key (sort { $a <=> $b } keys %what_when) {
	$shedule[$j][$i] = $what_when{$key};
	$shedule[$j][$i+1] = $key;
	$j++;
}

say Dumper(\@shedule);
