#!/usr/bin/perl

my $x = $ARGV[0];
my $y = $ARGV[1];
my $z = $ARGV[2];
my $sum = $x + $y + $z;
my $part1 = 0;
my $part2 = 0;
my $part3 = 0;
$part1 = ($x/$sum)*100; 
printf sprintf "%.1f\n", $part1;
$part2 = ($y/$sum)*100;
printf sprintf "%.1f\n", $part2;
$part3 = ($z/$sum)*100;
if($part1 + $part2 + $part3 < 100)
{
	printf sprintf "%.1f\n", $part3+0.1;
}
else 
{
	printf sprintf "%.1f\n", $part3;
}