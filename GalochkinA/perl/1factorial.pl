#!/usr/bin/perl
use strict;
use warnings;
use 5.010;


sub factorial {
    my $n = shift;

    if ($n == 0) {
        return 1;
    } else {
        return $n*factorial($n-1);
    }
}

sub fibonacci {
  my $n = shift;
  $n < 3 ? 1 : fibonacci($n-1) + fibonacci($n-2)
}
print "fibbonacci: ";
foreach (1..shift) {
  print fibonacci($_), ", ";
}
print "\nfactorial: ";
print factorial(shift);
print ("\n");


