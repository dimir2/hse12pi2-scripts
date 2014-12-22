#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use Data::Dumper qw(Dumper);
use Scalar::Util qw(looks_like_number);

sub helper
{
  print "Enter the numbers for 100% sum after the scripts name (name <num1> <num2> ... <numN>)\n";
  exit;
}

sub onehundred
{
   my $numbers=$_[0];
   my $sum;
   my $num;
   my @per;
   my $per_sum;
   my $psum=0;
   #print $numbers;-ref
   foreach $num (@$numbers)
   {
     $sum+=$num;
   }
   print "The sum is: ", $sum, "\n";
  
   my $i=0;
   foreach $num (@$numbers)
   {
     $per[$i]=($num/$sum)*100;
     $i++;
   }
   $i=0;
   foreach $num (@per)
   {
     $per_sum+=$num;
   }
   if($per_sum>100)
   {
     my $h=scalar @per;
     $per[$h-1]-=0.1; 
   }
   if($per_sum<100)
   {
     my $h=scalar @per;
     $per[$h-1]+=0.1; 
   }
   $i=0;
   foreach $num (@$numbers)
   {
     printf("$num is %.1f%% \n",$per[$i]);
     $psum+=$per[$i];
     $i++; 
   }
   printf ("Percent sum = %d%%\n", $psum);   
}

##########   main  ##############

if (scalar @ARGV == 0)
{
  helper();
  exit;
}

my @arr=@ARGV;
my @per;
#print $arr[0];

print("Your numbers are: ");
foreach my $val (@arr)
{
  print ( $val, " "); 
  if(!looks_like_number($val) || $val<0)
  {
    print "\nUncorrect number:(\n";
    exit;
  }   
}
print ("\n");
@per=onehundred(\@arr); 
exit;
