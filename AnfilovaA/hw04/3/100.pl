#!/usr/bin/perl

use warnings;
use 5.010;
use Data::Dumper qw(Dumper);

#calculate sum
my $sum = 0;

if ($#ARGV == -1)
{
   say "no arguments";
   exit;
}
for ($i = 0; $i <= $#ARGV; $i++)
{
   $sum += $ARGV[$i];
}
#print sum
say "summ $sum";
$sum /= 100;

# calculate percentages
@arr = ();
my $proc_res = 0;

for ($i = 0; $i <= $#ARGV; $i++)
{
   $arr[$i] = sprintf("%.1f", $ARGV[$i] / $sum);
   $proc_res += $arr[$i];
}

say "percentage $proc_res%";

if ($proc_res != 100 && ($proc_res - 100) <= $arr[$#ARGV])
{
   $arr[$#ARGV] = sprintf("%.1f", $arr[$#ARGV] + 100 - $proc_res);
}
else
{
  $i = 0;
  while (($proc_res - 100) >= $arr[$i])
     {$i++;}
  $arr[$i] = sprintf("%.1f", $arr[$i] + 100 - $proc_res);
}

#print array
print Dumper ( \@arr);
