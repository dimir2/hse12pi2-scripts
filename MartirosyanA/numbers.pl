#!/usr/bin/perl

use warnings;
use Data::Dumper qw(Dumper);
use POSIX;

my $summa = 0;


for ($i = 0; $i <= $#ARGV; $i++)
{
   $summa += $ARGV[$i];
}
print "summ is $summa \n";
$summa /= 100; 

@arr = ();
my $result = 0;

for ($i = 0; $i <= $#ARGV; $i++)
{
   $arr[$i] = sprintf("%.1f", $ARGV[$i] / $summa);
   $result += $arr[$i]; }
if ($result != 100)
{
   $arr[$#ARGV] += (100 - $result);
}
foreach (@arr)
{ print @arr ,"\n";
} 
