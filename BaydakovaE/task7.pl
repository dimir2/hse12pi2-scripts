#!usr/bin/perl

use Data::Dumper qw(Dumper);

my %what_when=(
   13=> 'Lunch',
   17=> 'Tea',
   20=> 'Dinner',
   9=> 'Breakfast',
);

print Dumper(\%what_when);

@key=keys %what_when;
sort @key;

my @list;
my $i=0, $j=0;
for my $key (keys %what_when)
{
   $list[$i][$j]=$what_when{$keys};
   $list[$i][$j+1]=$key;
   $i++;
}

print Dumper(\@list);
