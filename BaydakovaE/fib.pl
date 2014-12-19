#!usr/bin/perl

use warnings;

   my $number=shift;
   my $fib0=0;
   my $fib1=1;
   my $fib;

   while ($number>0)
    {
      $fib=$fib1+$fib0;
      $fib0=$fib1;
      $fib1=$fib;
      $number--;
    }

   print "$fib1\n";
