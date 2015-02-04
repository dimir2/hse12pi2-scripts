#!/usr/bin/perl

use Data::Dumper qw(Dumper);
use 5.010;
use warnings;

@input = @ARGV;

for ($i=0; $i<$#input; $i++)
{
	for ($j = 0; $j < $#input - $i; $j++)
	{
		if ($input[$j] > $input[$j+1])
		{
			$temp = $input[$j];
			$input[$j] = $input[$j+1];
			$input[$j+1] = $temp;	
		}
	}	
}

print Dumper ( \@input);
