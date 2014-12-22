#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use Switch;

sub helper
{
  print
"Keys:                   For getting:
   fib <number>            Fibonachi
   recfib <number>         RecursFibonachi
   fact <number>           Factorial
   recfact <number>        RecursFactorial\n";
  exit;
}
 
sub fact
{
  my $num=shift;
  my $n=1;
  
  if ($num<0)
  {
    print "Factorial error!\n";
    return;
  }
  else
  {
    for(my $j=2; $j<=$num; $j=$j+1)
    {
      $n=$n*$j;
    }
  }
  print "$num!=$n\n";
  return;
}

sub rec_fact
{
  my $num=shift;
  if($num<0)
  {
    print "Factorial Error!\n";
    exit;
  }
  elsif($num==0)
  {
    return 1;
  }
  else
  {
    return $num*rec_fact($num-1);
  }
}

sub fib
{
  my $num=shift;
  my $fib0=0;
  my $fib1=1;
  my $fib2;

  if ($num==0)
  {
    $fib2=0;
  }
  elsif ($num==1)
  {
    $fib2=1;
  }
  elsif ($num<0) 
  {
    print "Fibonachi Error!\n"; 
    return;
  }
  else
  {
    for (my $i=1; $i<$num; $i=$i+1)
    {
     $fib2=$fib1+$fib0;
     $fib0=$fib1;
     $fib1=$fib2;
    }
  }
  print "Fibonachi $num=$fib2\n";
  return;
}

sub rec_fib
{
   my $num=shift;
   my $fib;

   if ($num<0)
   {
     print "Fibonachi Error!\n";
     exit;
   }
   elsif (($num==1) || ($num==0))
   {
     return $num;
   } 
   else
   {
     return rec_fib($num-1)+rec_fib($num-2);
   }
}

##########   main  ##############

if (scalar @ARGV != 2)
{
  print "Wrong parametrs!\n";
  helper();
  exit;
}

my $fun=$ARGV[0]; 
my $num=$ARGV[1];
chomp $fun;

switch($fun)
{
  case "fib"      {fib($num);}
  case "recfib"   {print "RecFib $num=", 
                      rec_fib($num), "\n";}
  case "fact"     {fact($num);}
  case "recfact"  {print "RecFact $num=",
                      rec_fact($num), "\n";}
  else            {helper();}
}

exit;
