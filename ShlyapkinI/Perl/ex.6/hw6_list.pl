#!/usr/bin/perl

use Data::Dumper;
use 5.010;


my $t = [
[1980, 'Иванов', 'Иван', 'Иванович'],
[1980, 'Иванов', 'Сергей', 'Петрович'],
[1980, 'Сидоров', 'Семен', 'Семенович'],
[1985, 'Сидоров', 'Денис', 'Денисович'],
[1985, 'Константинопольский', 'Константин','Константинович'],
];

my $first_str = 0;
my $another_str = $first_str+1;
my $column = 0;
my $number_of_line = scalar(@{$t});
my $number_of_column = 4;
while ($another_str <= $number_of_line -1 )
{
	while (${${$t}[$first_str]}[$column] eq ${${$t}[$another_str]}[$column])
	{
		
		${${$t}[$another_str]}[$column] = "";
		$column++;
	}
	$another_str++;
	$column = 0;
	if (${${$t}[$first_str]}[$column] != ${${$t}[$another_str]}[$column])
	{
		$first_str = $another_str;
		$another_str = $first_str + 1;
	}
}

for (my $i = 0; $i < $number_of_line; $i++)
{

	for (my $j = 0; $j < $number_of_column	; $j++)
	{
		print "${${$t}[$i]}[$j]\t";
	}
	print "\n";	
}
