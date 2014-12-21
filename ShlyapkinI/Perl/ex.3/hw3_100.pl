#!/usr/bin/perl

use 5.010;
#use strict;
use warnings;

my $count = @ARGV;
if ($count < 1) {
	help();
	exit;
}
else {math();}

sub math
{
	my $sum;
	
	my $n=@ARGV;
	foreach $i (@ARGV) {$sum += $i;}
	
	my $percent=$sum/100;
	$sum=0;
	print "(";
	foreach $i (@ARGV)
	{
		my $num=sprintf('%.2f',$i/$percent);
		$sum+=$num;
		$n--;
		
		if ($n==0)
		{
			if ($sum!=100)
			{
				$num=$num+(100-$sum);
				print $num;
				print "%)";
				print "\n";
				exit;
			}
				print $num;
				print "%)";
				print "\n";
			exit;
		}
		print $num;
		print "%, ";
	}
}



sub help {
	say "+++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "++++++++++++++++ Script + Numbers +++++++++++++++++++";
	say "++++++++++++Ex. ++ ./hw3_100% 10 10 10 ++++++++++++++";
	say "+++++++++++++++++++++++++++++++++++++++++++++++++++++";
}
