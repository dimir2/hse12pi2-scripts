#!/usr/bin/perl

use Data::Dumper qw(Dumper);

my %what_when = (
	13 => 'Lunch',
	17 => 'Tea',
	20 => 'Dinner',
	9 => 'Breakfast',
);

print Dumper(\%what_when);

@keys = sort(keys(%what_when));
@values = sort(values(%what_when));

$i = 0;
my @schedual;
foreach $key (sort {$a<=>$b} @keys)
{
	$schedual[$i][0] = $key;
	$schedual[$i][1] = $what_when{$key};
	#print $key."=>".$what_when{$key}."\n";
	$i++;
}

print Dumper(\@schedual);
