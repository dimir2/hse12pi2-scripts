#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

#
# 1. Вычисление N-го числа Фибонначи и N! (факториал числа N)
#


#Фибоначи
sub fib {
my $toco = $_[0];
if($toco < 0 ) {
	print "Фибоначи от $toco нельзя посчитать";
	return;
}
if($toco == 0 ) {
	print "Фибоначи от $toco = 0";
	return;
}
my $mythiccount = 2;
my $fibtmp = 0;
my $fibprint = 1;
while($mythiccount <= $toco) {
	my $tmp = $fibprint;
	$fibprint += $fibtmp;
	$fibtmp = $tmp;
	$mythiccount++;
}
print "Фибоначи от $toco = $fibprint"
}

#Факториал
sub fac {
my $toco = $_[0];
if($toco < 0 ) {
	print "Факториал от $toco нельзя посчитать";
	return;
}
if($toco == 0 ) {
	print "Факториал от $toco = 1";
	return;
}
my $mythiccount = 1;
my $facprint = 1;
while($mythiccount <= $toco) {
	$facprint *= $mythiccount;
	$mythiccount++;
}
print "Факториал от $toco = $facprint"
}

#Main
sub main {
print "Введите число для фибоначи: ";
my $fibvar;
chomp ($fibvar = <STDIN>);
if (looks_like_number($fibvar)) { fib($fibvar); }
print "\n";

print "Введите число для факториала: ";
my $facvar;
chomp ($facvar = <STDIN>);
if (looks_like_number($facvar)) { fac($facvar); }

print "\n";
}




main();
__END__
