#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

sub add {
open(my $FH, ">>", "Telephone.txt");
print "Format:\n<Name> <Surname> <Phone number>\n";
my $x = <STDIN>;
my $old_point=select($FH); 
print $x;
select($old_point);
print "Success\n";
}

sub delet {
print "Format:\n<Name> <Surname> <Phone number>\n";
open(my $FH, "<", "Telephone.txt");
my @y=<$FH>;
close($FH);
chomp (my $x = <STDIN>);
my $i = 0;
foreach my $line (@y) {
	if($line =~ /$x/ ) {
		splice( @y, $i, 1);
	}
$i++;
}
open($FH, ">", "Telephone.txt");
my $old_point=select($FH); 
print @y;
select($old_point); 
print "Success\n";
}

sub getinfo {
open(my $FH, "<","Telephone.txt");
print "Format:\n<Name> <Surname> <Phone number> or <Phone number>\nWrite nothing to see full information\n";
chomp (my $x = <STDIN>);
if ( $x eq "") {
	my @y=<$FH>;
	foreach my $line (@y) {
		print $line;
	}
} else {
	my @y=<$FH>;
	foreach my $line (@y) {
		if($line =~ /$x/ ) {
			print $line;
		}
	}
}
}

sub Main {
print "Write add\nWrite del\nWrite info\nEnd\n";
my $flag = 1;
while( $flag ) {
	my $y;
	chomp ($y = <STDIN>);
	given($y) {
		when("add") { add(); }
		when("del") { delet(); }
		when("info") { getinfo(); }
		when("End") {$flag = 0;}
		default { print "Uxpected value\n"; }
}
}
}

Main();
__END__
