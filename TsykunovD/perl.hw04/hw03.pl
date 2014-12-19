#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

#
# 3.  На вход подается произвольное количество чисел N, например ( 12, 12, 12 ) - какие то показатели
#     На выходе нужно подсчитать % каждого числа в сумме, с точностью 1 цифра после запятой,
#     например ( 33.3%, 33.3%, 33.4%), причем сумма 
#     этих значений должна быть рана ТОЧНО 100%
#


#print как надо
sub printlist {
my $tmp=1;
print "\n( ";
foreach my $element (@_) {
	if( $tmp != scalar @_) {
		print "$element, ";
	}else {
		print "$element ";
	}
$tmp++;
}
print ")\n";
}
#print как надо2
sub printlist2 {
my $tmp=1;
print "\n( ";
foreach my $element (@_) {
	if( $tmp != scalar @_) {
		print "${element}%, ";
	}else {
		print "${element}% ";
	}
$tmp++;
}
print ")\n";
}


#Подсчёт
sub foo {
my $sum = 0;
foreach my $element (@_) {
	$sum += $element;	
}
my @pList;
my $pSum = 0;
foreach my $element (@_) {
	my $ptmp = sprintf("%.1f",($element/$sum)*100);
	push ( @pList, $ptmp );	
	$pSum += $ptmp;
}

if($pSum == "100") {
	printlist2(@pList);
}else{
	
	$pList[-1]+=(100-$pSum);
	printlist2(@pList);
}

}


#Main
sub main {
print "Введите одно или несколько чисел для задачи \"100%\"\n(для завершения ввода напечатайте end): ";
my $tmp;
my @list;
my $x = 1; #while(1) = while(true)
while( $x ) {
	chomp( $tmp = <STDIN>);
	if( looks_like_number($tmp) ) {
		push ( @list, $tmp );
	}elsif( $tmp eq "end" ) {
		$x=0;
	}
}
#if(scalar @list == 0)
print "Вы ввели масив: ";
printlist(@list);
foo(@list);


print "\n";
}




main();
__END__
