#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

#
#  6. Требуется напечатать это($t) в виде таблицы, исключив повторяющиеся 
#     элементы в начале строк:
#

#print как надо
sub printlist {
my $x = 1;
my $y = 1;
my $z = 1;

my @struct;
$struct[0] = "";
$struct[1] = "";
$struct[2] = "";
$struct[3] = "";
print "[";
for($x = 0; $_[$x] ; $x++) {
	print "\n\t[";
	for($y = 0; $_[$x][$y] ; $y++) {
		print "\n\t\t[";
		if ($struct[0] ne $_[$x][$y][0] ) {
			$struct[0] = "";
			$struct[1] = "";
			$struct[2] = "";
			$struct[3] = "";
		}
		for($z = 0; $_[$x][$y][$z] ; $z++) { 

			if ($struct[$z] ne $_[$x][$y][$z] || $struct[$z] eq "") {
				print "$_[$x][$y][$z]\t";
				$struct[$z] = $_[$x][$y][$z];
			}else { print "\t" } 
		}
		print "]";
	}
	print "\n\t]";
}
print "\n]\n";
}


sub main {


my @t = [
   [1980, 'Иванов', 'Иван', 'Иванович'],
   [1980, 'Иванов', 'Сергей', 'Петрович'],
   [1980, 'Сидоров', 'Семен', 'Семенович'],
   [1985, 'Сидоров', 'Денис', 'Денисович'],
   [1985, 'Константинопольский', 'Константин',
          'Константинович'],
];

printlist(@t);

}


main();
__END__
