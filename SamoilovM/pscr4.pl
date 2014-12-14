#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use locale;

sub remove {
	open(my $rf, '<phonebook.txt') or die ("I can not open the file");
	open(my $wf, '>wphonebook.txt') or die ("I can not open the file");
	my ($input) = @_;
	$input = '~' . $input . '~';
	my $flag = 0;

	while ($_ = <$rf>) {
		if (/$input/) {
			say "The contact removed successfully.";
			$flag = 1;
		}
		unless (/$input/) {
			print $wf $_;
		}
	}
	if ($flag == 0) {
		say "This contact doesn't exist!";
	}
	close $rf;
	close $wf;
	rename 'wphonebook.txt', 'phonebook.txt';
}

sub show {
	open(my $fh, '<phonebook.txt') or die ("I can not open the file");
	my ($input) = @_;
	
	while ($_ = <$fh>) {
		chomp $_;
		if (/$input/) {
			say $_;
		}
	}
	close $fh;		
}

say "What do you want?";
print "Press 'a' to add a contact\nPress 'd' to remove a contact\nPress 's' to see a contact\n";
my $input = <>;
chomp $input;
if ($input eq 'a') {
	open(my $fh, '>>phonebook.txt') or die ("I can not open the file");
	say "Input the name:";
	$input = <>;
	chomp $input;
	print $fh '~';
	print $fh $input;
	print $fh '~';
	say "Input the phone number:";
	$input = <>;
	print $fh $input;
	close $fh;
	say "The contact added successfully.";
}
elsif ($input eq 'd') {
	say "Input the name of the contact you want to delete:";
	$input = <>;
	chomp $input;
	remove($input);
}
elsif ($input eq 's') {
	say "Input the name of the contact you want to see:";
	$input = <>;
	chomp $input;
	show($input);
}
else {
	say "You are an idiot";
}
