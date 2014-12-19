#!/usr/bin/perl

use 5.010;
use strict;
use warnings;


my @arguments = @ARGV;

my $sum; 
foreach my $val (@arguments) {
		$sum += $val;
	}

my @percantage;

foreach my $val(@arguments){
	my $npe = ($val/$sum) * 100;
	push @percantage, sprintf("%.1f", $npe);
}

foreach my $val (@arguments) {
		$sum += $val;
	}
my $max = 0;
my $count = 0;
my $countper = 0;
foreach my $val (@arguments) {
$count++;
	if($val > $max){
		$max = $val;
	$countper = $count;
	}
}

if ( $sum != 100){
	$percantage[$countper-1] += 0.1;
}
print join(', ',@percantage);
print ("\n");

