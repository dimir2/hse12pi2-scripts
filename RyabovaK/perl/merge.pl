#!/usr/bin/env perl
use 5.008;
use strict;
use warnings;

sub merge
{
	my ($arr, $first, $last)=@_;

	my $size=$last-$first;

	if($size<2)
	{return;}
	
	my $middle=$first+int($size/2);

	merge($arr, $first, $middle);
	merge($arr, $middle, $last);

	for(my $i=$first; $i<$middle; ++$i)
	{
		if($$arr[$i] > $$arr[$middle]) 
		{
			my $j=$$arr[$i];
			$$arr[$i]=$$arr[$middle];

			my $i=$middle;
			while($i<$last-1 && $$arr[$i+1] < $j)
			{
				($$arr[$i], $$arr[$i+1])=($$arr[$i+1], $$arr[$i]); 
				++$i;
			}
			$$arr[$i]=$j;
		}
	}
}

sub sort_num
{
	my $size=@_;
	merge(\@_, 0, $size);
}


my @mass=qw(9 8 6 98 43 12 59 52 4 5 14 2 92 3 32 54);
print "before sort:";
foreach (@mass) {
	print " $_"
}
print "\n";

sort_num(@mass);
print "after sort:";
foreach (@mass) {
	print " $_"
}
print "\n";
