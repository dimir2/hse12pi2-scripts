#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use utf8; #There were troubles with sub 'length' and russian characters

binmode(STDOUT,':utf8'); #There were troubles with 'Wide character' warnings

my $t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];

my $j = 0;
my $k = 0; #special flag
for (my $i = 0; $i < scalar @{$t}; $i++) { #list
	while ($j < scalar @{$t->[$i]}) { #element
		if ($i == 0) { #print first string
			print @{$t->[$i]}[$j] . ' ';
		}
		else { #other strings
			if ((@{$t->[$i]}[$j] eq @{$t->[$i-1]}[$j]) && $k == $j) { #if elements are equal
				for (my $n = 0; $n <= length @{$t->[$i]}[$j]; $n++) { #for readability
					print ' '; 
				}
				$k = $j + 1;
			}
			else { #no equal elements in the start
				$k = 0;
				print @{$t->[$i]}[$j] . ' ';
			}
		}
		$j++; #next element
	}
	print "\n";
	$j = 0;
}
