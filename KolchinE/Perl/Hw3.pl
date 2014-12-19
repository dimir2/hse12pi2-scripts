#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

sub printlist {
my $i = 1;
print "\n( ";
foreach my $element (@_) {
	if( $i <= scalar @_) {	
		print "$element ";
	}
$i++;
}
print ")\n";
}


sub printlist2 {
my $i=1;
print "\n( ";
foreach my $element (@_) {
	if( $i <= scalar @_) {
		print "${element}% ";
	}
$i++;
}
print ")\n";
}


sub result {
my $sum = 0;
foreach my $element (@_) {
	$sum += $element;	
}
my @procent;
my $pSumm = 0;
foreach my $element (@_) {
	my $ptmp = sprintf("%.1f",($element/$sum)*100);
	push ( @procent, $ptmp );	
	$pSumm += $ptmp;
}

if($pSumm == "100") {
	printlist2(@procent);
}
	else{
	
	$procent[-1]+=(100-$pSumm);
	printlist2(@procent);
}
}



sub main {
print "Введите числа для задачи \"100%\"\n(для завершения ввода введите end): ";
my $tmp;
my @list;
my $x = 1; 
while( $x ) {
	chomp( $tmp = <STDIN>);
	if( looks_like_number($tmp) ) {
		push ( @list, $tmp );
	}
	elsif( $tmp eq "end" ) {
		$x=0;
	}
}

print "Mасcив: ";
printlist(@list);
result(@list);


print "\n";
}




main();
__END__
