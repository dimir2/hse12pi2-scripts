#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use utf8;
binmode (STDOUT, ":utf8");

use Data::Dumper qw(Dumper);


my $t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];

print_table($t, 2);

sub print_table {
	my ($table) = $_[0];
	my $compare_level = $_[1];
	my @lengths;
	for my $str (@$table) {
		for my $i (0 .. $#$str) {
			my $l = length $str->[$i];
			if ((!exists $lengths[$i]) || ($lengths[$i] < $l)) {
				$lengths[$i] = $l;
			}
		}
	}
	for my $entry_i (0 .. $#$table) {
		my $compare_on = 1;
		for my $str_i (0 .. $#{$table->[$entry_i]}) {
			if (	($entry_i == 0)
				|| (!$compare_on)
				|| ($str_i > $compare_level)
				|| ($table->[$entry_i]->[$str_i] ne $table->[$entry_i-1]->[$str_i])
			) {
				printf("%-$lengths[$str_i]s ", $table->[$entry_i]->[$str_i]);
				$compare_on = 0;
			} else {
				print " " x ($lengths[$str_i]+1);
			}
		}
		say '';
	}
	return;
}
