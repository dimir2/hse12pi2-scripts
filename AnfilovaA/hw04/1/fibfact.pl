#!/usr/bin/perl

use warnings;
use 5.010;


sub fact {
my @argument = @_;
my $res = 1;
for (;$argument[0]>0;$argument[0]--){
	$res = $res * $argument[0];
}
return $res;
}

sub fib {
my $a = 0;
my $b = 1;
@arg = @_;
if ($arg[0] == 0)
   {return $a;}
if ($arg[0] == 1)
   {return $b;}
for ($arg[0]-=2;$arg[0]>0;$arg[0]--){
	$temp = $a;
	$a = $b;
	$b = $temp + $b;
}
return $a + $b;
}

#say $ARGV[0];
print "factorial  $ARGV[0] = ";
say &fact($ARGV[0]);
print "fibonacci $ARGV[0] = ";
say &fib($ARGV[0]);
