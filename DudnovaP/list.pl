#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Data::Dumper;

my $t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];
my $number = scalar @{$t};
say $number;
for(my $k=0; $k<=3; $k++)
{
	my $swap = ${${$t}[0]}[$k];
	for(my $j=1; $j< scalar(@{$t}); $j++)
	{
		if(${${$t}[$j]}[$k] eq $swap)
		{
			${${$t}[$j]}[$k] = "";
			${${$t}[$j]}[$k] = $swap if((${${$t}[$j]}[$k-1] ne "")&&($k ne 0));	
		}else{	
			$swap = ${${$t}[$j]}[$k];
		}
	}
}
for(my $j=0; $j< scalar(@{$t}); $j++)
{
	for(my $k=0; $k<=3; $k++)
	{
		print "${${$t}[$j]}[$k]\t";
	}
	say "";	
}
