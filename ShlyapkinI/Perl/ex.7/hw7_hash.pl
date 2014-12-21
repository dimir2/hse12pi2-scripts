#!/usr/bin/perl
use Data::Dumper qw(Dumper);
use Scalar::Util qw(looks_like_number);
my %what_when = (
13 => 'Lunch',
17 => 'Tea',
20 => 'Dinner',
9 => 'Breakfast',
);
	
@keys = keys %what_when;


foreach $key (sort {$a<=>$b} @keys)
{
$schedual[$i][0] = $key;
$schedual[$i][1] = $what_when{$key};
$i++;
}
print Dumper(\@schedual);

