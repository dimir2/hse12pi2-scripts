#!/usr/bin/perl

	use 5.18.2;
	use strict;
	use warnings;



####################################FUNCTIONS CALLING #############################################3
say "Welcome to FoneBook! Wanna call?";
print "Press 'add' to add a contact\nPress 'del' to remove a contact\nPress 'sh' to see a contact\nPress 'shall' to see all contacts\n";
my $input = <>;
chomp $input;

if ($input eq 'add') {
	Add();
}

elsif ($input eq 'del') {
	say "Say goodbye to:";
	$input = <>;
	chomp $input;
	Delete($input);
}

elsif ($input eq 'sh') {
	say "Get ready for call?";
	$input = <>;
	chomp $input;
	Show($input);
}
elsif ($input eq 'shall'){
	open(my $file, '<phonebook.txt') or die ("I can not open the file");

	while(<$file>)
	{
	print;
	}
}

else {
	say "Try more";
}

##################################### FUNCTIONS #####################################################



#adding new element to phonebook to the end of file
sub Add {
	open(my $file, '>>phonebook.txt') or die ("No such file :(");
	say "Pull the name, buddy:";
	my $input = <>;
	chomp $input;
	print $file ' ';
	print $file $input;
	print $file ' ';
	say "Don't forget the number!";
	$input = <>;
	print $file $input;
	close $file;
	say "Done!";
}


#Deleting the contact with rewriting the file
sub Delete {
	open(my $in, '<phonebook.txt') or die ("No such file :(");
	open(my $out, '>phonebook1.txt') or die ("No such file :(");
	my ($input) = @_;
	$input = ' ' . $input . ' ';

	while ($_ = <$in>) {
		if (/$input/) {
			say "I made him an offer he/she couldn’t refuse.";
		}
		unless (/$input/) {
			print $out $_;
		}
	}

	close $in;
	close $out;
	rename 'phonebook1.txt', 'phonebook.txt';
}


#Shows the string in file with equal name
sub Show {
	open(my $file, '<phonebook.txt') or die ("I can not open the file");
	my ($input) = @_;
	
	while ($_ = <$file>) {
		chomp $_;
		if (/$input/) {
			say $_;
		}
	}
}
