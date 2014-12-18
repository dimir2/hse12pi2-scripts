#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Data::Dumper qw(Dumper);

my @arr = ('5', '2', '3', '0', '1', '8');

#say Dumper sortMerge(\@arr);
say Dumper sortQuick(\@arr);

sub sortMerge {
	my $arr = $_[0];
	return sortMergeRec($arr, 0, scalar @$arr);
}

sub sortMergeRec {
	my $arr = $_[0];
	my $left = $_[1];
	my $right = $_[2];
	my $size = $right - $left;
	my $mid = $left + int ($size / 2); 
	if ($size <= 1) {
		return $arr;
	}
	sortMergeRec($arr, $left, $mid);
	sortMergeRec($arr, $mid, $right);
	my @buffer = ();
	my $i = $left;
	my $j = $mid;
	while (($i < $mid) && ($j < $right)) {
		if ($arr->[$i] < $arr->[$j]) {
			push @buffer, $arr->[$i];
			++$i;
		} else {
			push @buffer, $arr->[$j];
			++$j;
		}
	}
	if ($i < $mid) {
		push @buffer, @{ $arr }[$i .. $mid - 1];
	}
	if ($j < $right) {
		push @buffer, @{ $arr }[$j .. $right-1];
	}
	for $i (0 .. $#buffer) {
		$arr->[$left + $i] = $buffer[$i];
	}
	return $arr;
}

sub sortQuick {
	my $arr = $_[0];
	return sortQuickRec($arr, 0, scalar @$arr);
}

sub sortQuickRec {
	my $arr = $_[0];
	my $left = $_[1];
	my $right = $_[2];
	my $size = $right - $left;
	if ($size <= 1) {
		return $arr;
	}
	my $midNumber = $left + int rand($size);
	my $mid = $arr->[$midNumber];
	my $i = $left;
	my $j = $right - 1;
	do {
		while ($arr->[$i] < $mid) {
			++$i
		};
		while ($arr->[$j] > $mid) {
			--$j
		};
		if ($arr->[$i] >= $arr->[$j]) {
			if ($i <= $j) {
				my $tmp = $arr->[$i];
				$arr->[$i] = $arr->[$j];
				$arr->[$j] = $tmp;
				++$i;
				--$j;
			}
		}
	} while ($i <= $j);
	sortQuickRec($arr, $left, $i);
	sortQuickRec($arr, $i, $right);
	return $arr;
}

