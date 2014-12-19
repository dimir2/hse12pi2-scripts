#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

sub printtable {

my @stroca;
$stroca[0] = "";
$stroca[1] = "";
$stroca[2] = "";
$stroca[3] = "";

my $x = 1;
my $y = 1;
my $z = 1;

for($x = 0; $_[$x] ; $x++) {
	for($y = 0; $_[$x][$y] ; $y++) {
		print "\n\t[";
		if ($stroca[0] ne $_[$x][$y][0] ) {
			$stroca[0] = "";
			$stroca[1] = "";
			$stroca[2] = "";
			$stroca[3] = "";
		}
		for($z = 0; $_[$x][$y][$z] ; $z++) { 

			if ($stroca[$z] ne $_[$x][$y][$z] || $stroca[$z] eq "") {
				print "$_[$x][$y][$z]\t";
				$stroca[$z] = $_[$x][$y][$z];
			}
			else { print "\t" } 
		}
		print "]";
	}
	print "\n";
}
print "\n"
}

sub Main {

my @table = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];

printtable(@table);
}

Main();
__END__
