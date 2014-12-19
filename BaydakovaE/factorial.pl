#!/usr/bin/perl

use warnings;
   
  my $number=shift;
  my $res=1;

  if ($number == 0)
   {
      print "1";
   }
  else
   {
      for ($i=2; $i<=$number; $i++)
        {
           $res=$res*$i;
        }
   } 
  print "$res\n";


