#!/usr/bin/perl
use 5.010;
use strict;
use warnings;


my $file = "database.txt";
open(my $fh, "<", $file)
or die "Could not open file '$file' $!";
close($fh);

say "What do you want to make? Add,remove or get contact";
my $enter;
chomp ($enter = <STDIN>);


if ($enter eq "add") {add();

} elsif ($enter eq "remove") {remove();

} elsif($enter eq "get") {get();

}else{
	help();
	return;
}


sub add {
	my $file = "database.txt";
	open(my $temp, ">", $file);
	say "Enter contact which you want to add";
	my $enter = <STDIN>;
	my $point=select($temp);
	print $enter;
	select($point);
}



sub remove {
	say "Enter contact which you want to remove";
	my $file = "database.txt";
	open(my $temp, "<", $file);
	my @strings=<$temp>;
	close($temp);
	chomp (my $enter = <STDIN>);
	my $i = 0;
	foreach my $line (@strings) {
		if($line eq $enter ) {
			splice( @strings, $i, 1);
					}
		$i++;
				}
	open($temp, ">", $file);
	my $point=select($temp);
	print @strings;
	select($point);
}


sub get {
	my $file = "database.txt";
	open(my $temp, "<", $file);
	say "Enter contact which you want to get";
	chomp (my $enter = <STDIN>);
	if ( $enter eq "all") {
		my @strings=<$temp>;
		foreach my $line (@strings) {
					print $line;
						}
			} else {
				my @strings=<$temp>;
				foreach my $line (@strings) {
								if($line eq $enter ) {
										print $line;
											}
							}
				}
			}

sub help
{
	say "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "+ Action ++++++++++++++++++++ Parametrs +++++++++++++++++++++++";
	say "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "+ add +++++ add contact +++++ FirstName && LastName && Number +";
	say "+ get +++++ get contact +++++ FirstName || LastName || Number +";
	say "+ remove ++ remove contact ++ FirstName && LastName && Number +";
	say "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
}
