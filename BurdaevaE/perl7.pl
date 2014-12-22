#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use Data::Dumper qw(Dumper);

##########   main  #############
my %hash = (
    13 => 'Lunch',
    17 => 'Tea',
    20 => 'Dinner',
     9 => 'Breakfast',
    22 => 'Sleep'
);

my %table;
my @ttable=();

print("Time-table before sort:\n");
while (my ($key,$value)=each %hash)
{
  print "$value  at  $key\n";
};

%table=reverse %hash;

print("\nTime_table after sort:\n");

my $i=0;
my $j=0;

foreach (sort {$table{$a} <=> $table{$b}} keys %table)
{ 
  #print $_, '=>', $table{$_}, "\n";
  $ttable[$i][$j]=$table{$_};
  $j++;
  $ttable[$i][$j]=$_;
  $j=0;
  $i++;
};

my $i1=0;
for($i1; $i1<$i; $i1++)
{
  print "[$ttable[$i1][1] at $ttable[$i1][0]]\n";
}
#print Dumper(\@ttable);

exit;
