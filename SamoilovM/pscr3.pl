#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use Data::Dumper qw(Dumper);
use Scalar::Util qw(looks_like_number);

my $input = <>;
my @array = split(' ', $input);

for my $elem (@array) {
	if (!looks_like_number($elem) || $elem < 0) {
		say "You are an idiot!";
		exit;
	}		
}

my $sum;
for my $elem (@array) {
	$sum+=$elem;
}

if ($sum == 0) {
	say "I can't divide by zero, I'm so sorry:((";
	exit;
}

my @par;
my $i=0;
for my $elem (@array) {
	$par[$i]=sprintf("%.1f", $elem/$sum*100);
	$i++;
}

$sum=0;
for (my $i=0; $i < (scalar @par) - 1; $i++) {
	$sum+=$par[$i];
}

$par[$#par] = sprintf("%.1f", 100 - $sum);

for my $elem (@par) {
	$elem=$elem . '%';
}

say Dumper(\@par);
