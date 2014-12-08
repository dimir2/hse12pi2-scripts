use strict;
use warnings;

use 5.010;

use Data::Dumper qw(Dumper);

my %aHash = (
	one => 1,
	two => 2,
	three => 3,
	);

print Dumper(\%aHash);

my %rHash = ();

for my $key (keys %aHash) {
	$rHash{$aHash{$key}} = $key;
}

print Dumper(\%rHash);
