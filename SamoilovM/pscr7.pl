#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use Data::Dumper qw(Dumper);

my %what_when = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);

my @shedule = ();

my $k = 0;
my $l = 0;

my %rHash = ();

for my $key (keys %what_when) { #preparing for sort; swap keys and values
	$rHash{$what_when{$key}} = $key;
}

for my $key (sort { $rHash{$a} <=> $rHash{$b} } keys %rHash) { #sort
	$shedule[$k][$l] = $rHash{$key};
	$l++;
	$shedule[$k][$l] = $key;
	$l = 0;
	$k++;
}

say Dumper(\@shedule);
