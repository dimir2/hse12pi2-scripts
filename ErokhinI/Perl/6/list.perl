#!/usr/bin/perl

my @s = (
	[1980,'Ivanov','Ivan','Ivanovich'],
	[1980,'Ivanov','Sergei','Petrovich'],
	[1980,'Ivanov','Sergei','Babich'],
	[1980,'Sidorov','Semen','Semenovich'],
	[1985,'Sidorov','Denis','Denisovich'],
	[1985,'Konstantinov', 'Konstantin', 'Konstantinovich'],
	);

$i = 0;
foreach(@s)
{
	if($s[$i][0] eq $s[$i-1][0])
	{
		print "\t";
		if($s[$i][1] eq $s[$i-1][1])
		{
			print "\t";
			if($s[$i][2] eq $s[$i-1][2])
			{
				print "\t";
				print $s[$i][3]."\t";	
			}
			else
			{
				print $s[$i][2]."\t";
				print $s[$i][3]."\t";
			}
		}
		else
		{
			print $s[$i][1]."\t";
			print $s[$i][2]."\t";
			print $s[$i][3]."\t";
		}
	}
	else
	{
		print $s[$i][0]."\t";
		print $s[$i][1]."\t";
		print $s[$i][2]."\t";
		print $s[$i][3]."\t";
	}
	print "\n";
	$i++;
}
