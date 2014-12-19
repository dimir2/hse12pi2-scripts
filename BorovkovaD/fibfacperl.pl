#!/usr/bin/perl

$shift = $ARGV[1];
if ( $ARGV[0] eq 'fib') 
	{ print fib($shift);} 
elsif ( $ARGV[0] eq 'fac') 
	{ print fac($shift);} 
else 
	{ print "Error";}

sub fac {
	my $n=shift;
    if ($n == 0) 
	{ return 1;}
	else 
	{ return $n*fac($n-1);}
}

sub fib {
	my $n=shift;
	if($n < 2)
	{ return $n;}
	else { return fib($n-1)+fib($n-2);}
}