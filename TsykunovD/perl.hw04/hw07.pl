#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Data::Dumper qw(Dumper);
#
#   7.  Требуется: сформировать список пар, отсортированных по ключу хеша 
#	(в примере — по времени):
#

sub hSort {
my %toSort = @_;
my @hSorted = [];
my @tKeys;
my $i = 0;
my $tmp=0;
@tKeys = sort { $a <=> $b } keys %toSort;
for($i;$i < scalar @tKeys ; $i++ ) {
	$hSorted[$tmp] = $tKeys[$i];
	$hSorted[$tmp+1] = $toSort{$tKeys[$i]};
	$tmp+=2;
		
}
return @hSorted;
}


sub main {
my %what_when = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);
print Dumper(\%what_when);
my @hSort = hSort(%what_when);
print Dumper(\@hSort);
}



main();
__END__
