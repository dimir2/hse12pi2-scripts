#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

if (scalar @ARGV == 0) {
	print_help();
	exit;
}

my @perc = compute_percentage(\@ARGV);
say join(" ", @perc);

sub print_help {
	say "Usage: VAL1 VAL2 .. VALN";
	say "Compute percentage of values in their sum.";
	return;
}

sub compute_percentage {
	my $vals = $_[0];
	my @percentages = ();

	my $sum = 0;
	for my $val (@$vals) {
		$sum += $val;
	}
	
	my @modulos = ();
	for my $val (@$vals) {
		my $perc = ($val / $sum) * 100;
		my $modulo = (($perc*100) % (0.1*100)) / 100;
		push @modulos, $modulo;
		push @percentages, sprintf("%.1f", $perc);
	}

	my @candidates = sort { $modulos[$a] <=> $modulos[$b] } (0 .. $#modulos);
	
	my $perc_sum = 0;
	for my $perc (@percentages) {
		$perc_sum += $perc;
	}

	if ($perc_sum > 100) {
		for my $i (0 .. sprintf("%.0f", ($perc_sum*10 - 1001))) {
			my $val_i = $candidates[$i];
			$percentages[$val_i] -= 0.1;
		}
	} elsif ($perc_sum < 100) {
		for my $i (sprintf("%.0f", ($perc_sum*10 - 999)) .. 0) {
			my $val_i = $candidates[$i];
			$percentages[$val_i] += 0.1;
		}
	}
	
	return @percentages; 
}
