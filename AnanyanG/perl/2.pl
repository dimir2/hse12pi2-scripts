#!/usr/bin/perl

use 5.010;
use strict;
use warnings;


my $mode = $ARGV[0];
my @arr = @ARGV;
shift @arr;


my $result = [];
if ("merge" =~ /$mode/) {
	$result = sort_merge(\@arr);
} elsif ("heap" =~ /$mode/) {
	$result = sort_heap(\@arr);
} elsif ("quick" =~ /$mode/) {
	$result = sort_quick(\@arr);
} 

say join(" ", @$result);

sub sort_heap {
	my $arr = $_[0];
	if (scalar @$arr <= 1) {
		return $arr;
	}

	build_heap($arr);

	for my $i (0 .. $#$arr) {
		my $last = $#$arr - $i;
		my $t = $arr->[0];

		$arr->[0] = $arr->[$last];
		$arr->[$last] = $t;
		heapify($arr, 0, 0, $last);
	}
	return $arr;
}

sub build_heap {
	my $arr = $_[0];
	for (my $i  = scalar @$arr / 2; $i >= 0; --$i) {
		heapify($arr, $i, 0, scalar @$arr);
	}
}

sub heapify {
	my $arr = $_[0];
	my $index = $_[1];
	my $left_bnd = $_[2];
	my $right_bnd = $_[3];
	if ($index > $right_bnd) {
		return;
	}
	my $left = 2*$index;
	my $right = 2*$index + 1;
	my $largest = $index;
	if ($left < $right_bnd) {
		if ($arr->[$left] > $arr->[$largest]) {
			$largest = $left;
		}
	}
	if ($right < $right_bnd) {
		if ($arr->[$right] > $arr->[$largest]) {
			$largest = $right;
		}
	}
	if ($largest != $index) {
		my $t = $arr->[$index];
		$arr->[$index] = $arr->[$largest];
		$arr->[$largest] = $t;
		heapify($arr, $largest, $left_bnd, $right_bnd);
	}
}

sub sort_merge {
	my $arr = $_[0];
	return sort_merge_bnd($arr, 0, scalar @$arr);
}

sub sort_merge_bnd {
	my $arr = $_[0];
	my $left_bnd = $_[1];
	my $right_bnd = $_[2];
	my $size = $right_bnd - $left_bnd;
	my $middle = $left_bnd + int ($size / 2); 
	if ($size <= 1) {
		return $arr;
	}
	sort_merge_bnd($arr, $left_bnd, $middle);
	sort_merge_bnd($arr, $middle, $right_bnd);
	my @buffer = ();
	my $i = $left_bnd;
	my $j = $middle;
	while (($i < $middle) && ($j < $right_bnd)) {
		if ($arr->[$i] < $arr->[$j]) {
			push @buffer, $arr->[$i];
			++$i;
		} else {
			push @buffer, $arr->[$j];
			++$j;
		}
	}
	if ($i < $middle) {
		push @buffer, @{ $arr }[$i .. $middle - 1];
	}
	if ($j < $right_bnd) {
		push @buffer, @{ $arr }[$j .. $right_bnd-1];
	}
	for $i (0 .. $#buffer) {
		$arr->[$left_bnd + $i] = $buffer[$i];
	}
	return $arr;
}

sub sort_quick {
	my $arr = $_[0];
	return sort_quick_bnd($arr, 0, scalar @$arr);
}

sub sort_quick_bnd {
	my $arr = $_[0];
	my $left_bnd = $_[1];
	my $right_bnd = $_[2];
	my $size = $right_bnd - $left_bnd;
	if ($size <= 1) {
		return $arr;
	}
	my $pivot_i = $left_bnd + int rand($size);
	my $pivot = $arr->[$pivot_i];
	my $i = $left_bnd;
	my $j = $right_bnd - 1;
	do {
		while ($arr->[$i] < $pivot) {
			++$i
		};
		while ($arr->[$j] > $pivot) {
			--$j
		};
		if ($arr->[$i] >= $arr->[$j]) {
			if ($i <= $j) {
				my $t = $arr->[$i];
				$arr->[$i] = $arr->[$j];
				$arr->[$j] = $t;
				++$i;
				--$j;
			}
		}
	} while ($i <= $j);
	sort_quick_bnd($arr, $left_bnd, $i);
	sort_quick_bnd($arr, $i, $right_bnd);
	return $arr;
}
