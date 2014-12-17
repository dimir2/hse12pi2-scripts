#!/usr/bin/perl
use 5.18.2;
use strict;
use warnings;
use utf8; 

binmode(STDOUT,':utf8');

my $t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];
my $i=0;
my $j=0;
my $bul=0;
my $buk=0;
my $bu1=0;
foreach my $it (@{$t}){
	foreach my $jt (@{$t->[$i]}){
		if($bul > 1){
			print "$jt \t";
			$j++;
		}
		else{
			if($buk == 1){
				if($jt ne @{$t->[$i-1]}[1]){
				print "$jt \t";
				$buk = 0;
				}
				else { print " \t\t";
				$buk = 0;
				}

			}
			if($bul ==0){
				if($jt ne @{$t->[$i-1]}[0]){
					print "$jt \t";
				}
				else { print " \t\t";
					$buk = 1;
				}
			}
			
		}
		
		$bul++;
	}
	print " \n";
	$i++;
	$j=0;
	$bul=0;
}
