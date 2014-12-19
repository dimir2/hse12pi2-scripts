#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use utf8; 

binmode(STDOUT,':utf8');
use Data::Dumper qw(Dumper);
my %hash = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);
my @dup;
my $m=0; my $k=0;
for  my $key (sort { $a <=> $b } keys %hash) {
	$dup[$m][$k] = $hash{$key};
	$dup[$m][$k+1] = $key;
	$m++;
}
say Dumper(\@dup);
foreach $key(sort keys %hash){
	print "$key => $hash{$key}\n"; #отсортирует в алфавитном порядке по значениям ключа
}

foreach $value(sort values %hash){
	print "$value\n"; #сортировка по значению
}
