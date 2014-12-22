#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use utf8;
binmode(STDOUT, ':utf8');

sub newtable
{
  my ($t)=$_[0];
  my ($new)=($t);
  my $j=0;
  my $com=0; #stolbec
  my $n=0;
  my $comstr; #common str
  my $forcomstr; #ne ' ' str

  for(my $i=0; $i<scalar @{$t}; $i++) #lists
  {
    while($j<scalar @{$t->[$i]}) #elems
    {
       $forcomstr=$i-1;
       $comstr=$t->[$forcomstr]->[$j];
       while ($comstr eq " ")
       {
         $forcomstr-=1;
         $comstr=$t->[$forcomstr]->[$j];
       }
       if(($t->[$i]->[$j] eq $comstr) && ($com==$j))
       {
	 $new->[$i]->[$j]=" ";
         $com=$j+1;
       }
       else
       {
         $com=0;
       }
       $j++;
    }
    $j=0;
  }
  $j=0;
  for(my $ni=0; $ni<scalar @{$new}; $ni++)
  {
    while($j<scalar @{$new->[$ni]})
    {
        print $new->[$ni]->[$j] , "\t";
        $j++;
    }
    print ("\n");
    $j=0;
  }   
}

##########   main  #############

my $t = [
    [1980, 'Иванов', 'Иван', 'Иванович'],
    [1980, 'Иванов', 'Сергей', 'Петрович'],
    [1980, 'Сидоров', 'Семен', 'Семенович'],
    [1985, 'Сидоров', 'Денис', 'Денисович'],
    [1985, 'Константинопольский', 'Константин',
           'Константинович'],
];
my $j=0;

print "Before:\n";
for(my $i=0; $i<scalar @{$t}; $i++)
{
    while($j<scalar @{$t->[$i]})
    {
        print $t->[$i]->[$j] , "\t";
        $j++;
    }
    print ("\n");
    $j=0;
}       
print("\nAfter:\n");
newtable($t);
exit;
