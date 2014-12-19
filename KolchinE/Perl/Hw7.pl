#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Data::Dumper qw(Dumper);

sub Sort {
my %sort = @_;
my @sorte = [];
my $j = 0;
my @keys = sort { $a <=> $b } keys %sort;
for(my $i = 0;$i < scalar @keys ; $i++ ) {
	$sorte[$j] = $keys[$i];
	$sorte[$j+1] = $sort{$keys[$i]};
	$j+=2;
}
return @sorte;
}


sub Main {
my %Dano = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);
print Dumper(\%Dano);
my @massort = Sort(%Dano);
print Dumper(\@massort);
}

Main();
__END__
