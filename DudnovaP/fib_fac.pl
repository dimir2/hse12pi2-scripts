#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $var=0;
print "Input number:\n";
$var=<STDIN>; #remember with "\n"
chomp($var); #delete "\n"
print "Number: $var\n";

sub fac{
my $number = $_[0];
my $factorial=1;
for(my $i=2; $i<=$number; $i++)
{
	$factorial*=$i;
}
print "fac = $factorial\n";
}

sub fib{
my $number = $_[0];
my @FIBO;
$FIBO[0]=0;
$FIBO[1]=1;
$FIBO[2]=1;
for(my $j=3; $j<=$number; $j++)
{
	my $l=$j-1;
	my $k=$j-2;
	$FIBO[$j]=$FIBO[$l]+$FIBO[$k];
}
print "fib = $FIBO[$number]\n";
}

if ($var eq 0){
	print "results:\n";
	print "fac = 0\n";
	print "haven't got factorial\n";
}else{ 
	print "results:\n";
	fib($var);
	fac($var);
}
