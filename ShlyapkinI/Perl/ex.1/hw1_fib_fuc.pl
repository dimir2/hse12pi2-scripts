#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

my $count = @ARGV;
if ($count != 1) {
	help();
	return;
}

if ("fib" =~ /$ARGV[0]/) {

	print "Enter number of Fibonacci: ";
	my $fibnum;
	chomp ($fibnum = <STDIN>);
	looks_like_number($fibnum);	
	fib($fibnum);

	print "\n";

} elsif ("fac" =~ /$ARGV[0]/) {

	print "Enter number of fuctorial: ";
	my $facnum;
	chomp ($facnum = <STDIN>);
	looks_like_number($facnum);
	fac($facnum);

	print "\n";

} else {
	help();
	return;
}

sub fib {
	my $n = $_[0];
	my $actually = 1;
	my $early = 1;
	for (my $i=3;$i<=$n;$i++) {
		my $temp = $actually;
		$actually += $early;
		$early = $temp;
	}
	say $actually;
	return;
}

sub fac {
	my $n = $_[0];
	my $result = 1;
	for (my $i=2;$i<=$n;$i++) {$result *= $i;}
	say $result;
	return;
}

sub help {
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "++++++++++++++++ Script + Action +++++++++++++++++++++";
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "+fib + output number of Fibonacci ++++++++++++++++++++";
	say "+fac +++++ output factorial ++++++++++++++++++++++++++";
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
return
}
