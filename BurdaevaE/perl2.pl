#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use Switch;
use Data::Dumper qw(Dumper);

sub helper
{
  print
"Keys:                   For getting:
   qs <array>              QuickSort
   hs <array>              HeapSort
   ms <array>              MergeSort\n";
  exit;
}

######## QuickSort ########
sub doQSort
{
  my $fir=$_[0]; #first
  my $l=$_[1]; #last
  my $arr=$_[2];
  #print join(" ", @$arr);
  if ($fir==$l)
  {
    return;
  }
  
  my $add=($fir+$l)/2;
  my $cur=$arr->[$add];
  #print "\n", $cur, "\n";
  while ($fir<=$l)
  {
   while (($arr->[$fir]) < $cur)
   {
    $fir+=1;
   };
   
   while (($arr->[$l]) > $cur)
   {
    $l-=1;
   };
   
   if (($arr->[$fir]>=$arr->[$l]) && ($fir<=$l))
   {
    my $tmp;
    $tmp=$arr->[$fir];
    $arr->[$fir]=$arr->[$l];
    $arr->[$l]=$tmp;
    $fir+=1;
    $l-=1;
   }
  } 

 if($_[0]<$l)
 {
  doQSort($_[0], $l, $arr);
 }
 if($fir<$_[1])
 {
  doQSort ($fir, $_[1], $arr); 
 }
 return $arr;
}

sub QSort
{
  my $arr=$_[0];
  my $start=0;
  my $finish=scalar @$arr-1;
  return doQSort($start, $finish, $arr); 
}

######## HeapSort ########
sub maxheap
{
  my $arr=$_[1];
  my $n=scalar @$arr-1;
  my $parent=$_[0];
  my $left=2*$parent;
  my $right=2*$parent+1;
  my $largest=$parent;
 
  if($parent>$n)
  {
    return;
  }
  if($left<$n && $arr->[$left] > $arr->[$largest])
  {
    $largest=$left;
  }
  if($right<$n && $arr->[$right] > $arr->[$largest])
  {
    $largest=$right;
  }
  if ($largest!=$parent)
  {
    my $tmp;
    $tmp=$arr->[$largest];
    $arr->[$largest]=$arr->[$parent];
    $arr->[$parent]=$tmp;
    maxheap($largest, $arr);
  }
  return $arr;
}

sub buildHeap
{
  my $arr=$_[0];
  my $n=scalar @$arr;
  my $i=$n/2;
 
  for($i; $i>=0; --$i)
  { 
    maxheap($i, $arr);
  }
}

sub HSort
{
  my $arr=$_[0];
  my $n=scalar @$arr-1;
  if($n<1)
  {
    return;
  }

  buildHeap($arr);
  while($n>0)
  {
    my $tmp;
    $tmp=$arr->[0];
    $arr->[0]=$arr->[$n];
    $arr->[$n]=$tmp;
    $n--;
    buildHeap($arr);
  }
  return $arr;
}

######## MergeSort ########

sub doMSort
{
  my $left=$_[0];
  my $h=$_[1]; 
  my $right=$_[2];
  my $arr=$_[3];
  my @p;
  my $i;

  if(($h+1)>$right)
  { 
    return;
  } 
  for($i=$left; $i<$h+1; $i++)
  {
    push @p, $arr->[$i];
  }
  for($i=$h+1; $i<$right; $i++)
  {
    push @p, $arr->[$right+$h+1-$i];
  }
  my $k=$left;
  my $j=$right;
  for($i=$left; $i!=$right; $i++)
  {
    if ($p[$k]<=$p[$j])
    {
      $arr->[$i]=$p[$k++];
    }
    else
    {
      $arr->[$i]=$p[$j--];
    }
  }
  return $arr;
}

sub MSort #Division
{
  my $arr=$_[0];
  my $left=0;
  my $right=scalar @$arr-1;
  if ($left>$right)
  {
    return;
  }
  my $h=($left+$right)/2;
  MSort($left, $h, $arr);
  MSort($h+1, $left, $arr);
  return doMSort($left, $h, $right, $arr); 
}
##########   main  ##############

if (scalar @ARGV == 0)
{
  print "Wrong parametrs!\n";
  helper();
  exit;
}

my @arr=@ARGV;
#my $sortarr=QSort(\@arr);
#print join(" ", @$sortarr);
#my $msortarr=MSort(\@arr);
#print join(" ", @$msortarr);
#my $hsortarr=HSort(\@arr);
#print join(" ", @$hsortarr);
my $fun=$ARGV[0]; 
chomp $fun;
splice @ARGV, 0;

switch($fun)
{
  case "qs"      {print "$_" for QSort(\@ARGV);}
  case "hs"      {print "$_" for HSort(\@ARGV);}
  case "ms"      {print "$_" for MSort(\@ARGV);}
  else           {helper();}
}

exit;
