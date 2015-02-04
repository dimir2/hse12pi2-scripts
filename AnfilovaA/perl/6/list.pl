#!/usr/bin/perl

use warnings;
use 5.010;
use Data::Dumper qw (Dumper);

my $t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин','Константинович'],
];

my $line1 = 0;
my $line2 = 1;
my $row = 0;
my $count_line = scalar(@{$t});
while ($line1 <= $count_line && $line2 <= $count_line -1 )
{
	while (${${$t}[$line1]}[$row] eq ${${$t}[$line2]}[$row] && $row < 4)
	{
		${${$t}[$line2]}[$row] = " ";
		$row++;
		 
		
	}
	$line2++;
	$row = 0;
	if ($line2 < $count_line-1 && ${${$t}[$line1]}[$row] ne ${${$t}[$line2]}[$row])
	{
		$line1 = $line2;
		$line2 = $line1 + 1;
	}	
}

&myprint(); 


sub myprint 
{
say " ";
	$count = scalar(@{$t});
	for (my $i = 0; $i < $count; $i++)
	{
		my $count_in = scalar (@{${$t}[$i]});
		for (my $j = 0; $j < $count_in; $j++)
		{
			print "${${$t}[$i]}[$j]\t";
		}
		say " "; 
	}
say " ";
}
