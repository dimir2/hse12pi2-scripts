#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

sub fibonacci {
my $x = $_[0];

if($x < 0 ) {
	print "Warning! Cann't count";
	return;
}

if($x == 0 ) {
	print "Fibonacci $x = 0";
	return;
}

if(($x == 1 ) || ($x == 2)) {
	print "Fibonacci $x = 1";
	return;
}

my $i = 2;
my $y = 0;
my $fiboprint = 1;
while($i <= $x) {
	my $z = $fiboprint;
	$fiboprint += $y;
	$y = $z;
	$i++;
}

print "Fibonacci $x = $fiboprint"
}


sub factorial {
my $x = $_[0];

if($x < 0 ) {
	print "Warning! Cann't count";
	return;
}

if($x == 0 ) {
	print "Factorial $x = 1";
	return;
}

my $i = 1;
my $factorialprint = 1;
while($i <= $x) {
	$factorialprint *= $i;
	$i++;
}

print "Factorial $x = $factorialprint"
}

sub Main {
print "Fibonacci: ";
my $fib;
chomp ($fib = <STDIN>);
if (looks_like_number($fib)) { fibonacci($fib); }
print "\n";

print "Factorial: ";
my $fac;
chomp ($fac = <STDIN>);
if (looks_like_number($fac)) { factorial($fac); }
print "\n";

}

Main();
__END__
