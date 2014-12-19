#!usr/bin/perl

my @array = @ARGV;
my $size=$#array;
my $sum=0;

for(my $i=0; $i<$size+1; $i++)
{
   $sum=$sum+$array[$i];
}
my $sum2=0;
my $per_cent;
for(my $i=0; $i<$size; $i++)
{
   $per_cent=$array[$i]/$sum*100;
   $sum2=sprintf ("%.1f", $sum2+$per_cent);
   printf ("%.1f\n", $per_cent);  
}

  printf("%.1f\n", 100-$sum2);


