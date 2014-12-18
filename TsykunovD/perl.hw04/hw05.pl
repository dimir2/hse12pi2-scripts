#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

sub printWish {
open(my $FH, "<", "pozdrav.txt");
my @stringss=<$FH>;
close($FH);
my $strings = $stringss[0];
print "\nВведите Имя:";
chomp (my $name = <STDIN>);
print "\nВведите Фамилию:";
chomp (my $surname = <STDIN>);
print "\nВведите степень отношений (1 -хорошая/0-плохая):";
chomp (my $wish = <STDIN>);
if( $strings =~ m/<Surname>/ ) {
	print $`;print $surname;
}
if( $' =~ m/<Name>/ ) {
	print $`;print $name;
}
if( $' =~ m/<Wish>/ ) {
	print $`;
	if( $wish == 1 ) {print "Наилучшего!";}
	elsif( $wish == 0 ) {print "Наихудшего!";}
}
if( $' =~ m/<n>/ ) {
	print "\n";print $';
}
}

sub main {
printWish();
}



main();
__END__
