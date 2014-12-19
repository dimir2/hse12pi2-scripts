#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use List::MoreUtils qw(first_index any);

my $db_fname = prepare_db();

if (scalar @ARGV == 0) {
	terminal_mode($db_fname);
} else {
	process_args($db_fname);
}

sub prepare_db {
	my $db_fname = "phonebook_db";
	open (my $db_out, '>>', $db_fname)
		or die "Error: can't access file '$db_fname': $!";
	close $db_out;
	return $db_fname;
}

sub terminal_mode {
	while(1) {
		print "phonebook: ";
		my $input = <STDIN>;
		chomp $input;
		my @params = ($input =~ /(".*?"|\S+)/g);
		for my $param (@params) {
			$param =~ s/^"|"$//g;
		}
		process_cmd($db_fname, \@params);
	}
}

sub check_keyword {
	my $kw = $_[0];
	my @valid_kws = ("add", "remove", "get");
	if (!(any { /$kw/i } @valid_kws)) {
		print_help();
		return 0;
	}
	return 1;
}

sub print_help {
	my $help = <<'END_HELP';
Usage:	add NAME PHONE ADDRESS
	remove [[with id|name|phone|address] REGEXP]
	get [[with id|name|phone|address] REGEXP]

	NOTE: Use quotes for values with spaces in them.
END_HELP
	print $help;
	return;
}

sub process_args {
	my $db_fname = $_[0];
	my $args = \@ARGV;
	if (check_keyword($args->[0])) {
		process_query($db_fname, $args);
	}
	return;
}

sub process_cmd {
	my $db_fname = $_[0];
	my $cmd = $_[1];
	if (lc($cmd->[0]) eq "exit") {
		exit;
	} else {
		if (check_keyword($cmd->[0])) {
			process_query($db_fname, $cmd);
		}	
	}
	return;
}

sub process_query {
	my $db_fname = $_[0];
	my $query = $_[1];
	my $cmd = lc(shift @$query);
	if ($cmd eq "add") {
		cmd_add($db_fname, $query);
	}
	if ($cmd eq "remove") {
		cmd_remove($db_fname, $query);
	}
	if ($cmd eq "get") {
		cmd_get($db_fname, $query);
	}
	return;
}

sub cmd_add {
	my $db_fname = $_[0];
	my $query = $_[1];
	if (scalar @$query != 3) {
		say "Error: wrong format";
		print_help();
		return;
	}
	my $db_in = open_db_in();
	my @lines = <$db_in>;
	my $last_id = 0;
	if (-s $db_in) {
		my @fields = split(/ /, $lines[-1]);
		$last_id = $fields[0];
	}
	close $db_in;
	my $db_append = open_db_append();
	say $db_append $last_id+1 . " " . join(" ", map { "\"$_\"" } @$query);
	close $db_append;
	return;
}

sub cmd_remove {
	my $db_fname = $_[0];
	my $query = $_[1];
	my $regexp = ".*";
	if ((scalar @$query == 3) && ($query->[0] eq "with")) {
		my $field_i = get_field_i($query->[1]);
		if ($field_i == -1) {
			say "Error: '$query->[1]' - no such field";
			print_help();
			return;
		}
		$regexp = $query->[2];
		my $db_in = open_db_in();
		my @remaining = ();
		while (my $row = <$db_in>) {
			my @fields = split(" \"", $row);
			unless ($fields[$field_i] =~ m/$regexp/) {
				push @remaining, $row;
			}
		}
		close $db_in;
		my $db_out = open_db_out();
		for my $row (@remaining) {
			print $db_out $row;
		}
		close $db_out;
	} elsif (scalar @$query == 1) {
		$regexp = $query->[0];
		my $db_in = open_db_in();
		my @remaining = ();
		while (my $row = <$db_in>) {
			my @fields = split(" \"", $row);
			unless ($row =~ m/$regexp/) {
				push @remaining, $row;
			}
		};
		close $db_in;
		my $db_out = open_db_out();
		for my $row (@remaining) {
			print $db_out $row;
		}
		close $db_out;
	} elsif (scalar @$query == 0) {
		my $db_out = open_db_out();
		close $db_out;
	} else {
		say "Error: wrong format";
		print_help();
		return;
	}
	return;
}

sub cmd_get {
	my $db_fname = $_[0];
	my $query = $_[1];
	my $regexp = ".*";
	if ((scalar @$query == 3) && ($query->[0] eq "with")) {
		my $field_i = get_field_i($query->[1]);
		if ($field_i == -1) {
			say "Error: '$query->[1]' - no such field";
			print_help();
			return;
		}
		$regexp = $query->[2];
		my $db_in = open_db_in();
		while (my $row = <$db_in>) {
			my @fields = split(" \"", $row);
			if ($fields[$field_i] =~ m/$regexp/) {
				print_fields(@fields);	
			}
		}
		close $db_in;
	} elsif (scalar @$query == 1) {
		$regexp = $query->[0];
		my $db_in = open_db_in();
		while (my $row = <$db_in>) {
			my @fields = split(" \"", $row);
			if ($row =~ m/$regexp/) {
				print_fields(@fields);	
			}
		};
		close $db_in;
	} elsif (scalar @$query == 0) {
		my $db_in = open_db_in();
		while (my $row = <$db_in>) {
			my @fields = split(" \"", $row);
			print_fields(@fields);	
		};
		close $db_in;
	} else {
		say "Error: wrong format";
		print_help();
		return;
	}
	return;
}

sub open_db_in {
	open(my $db_in, '<', $db_fname)
		or die "Error: could not open file '$db_fname': $!";
	return $db_in;
}

sub open_db_append {
	open(my $db_append, '>>', $db_fname)
		or die "Error: could not open file '$db_fname': $!";
	return $db_append;
}

sub open_db_out {
	open(my $db_out, '>', $db_fname)
		or die "Error: could not open file '$db_fname': $!";
	return $db_out;
}

sub get_field_i {
	my $str = $_[0];
	my @fields = ("id", "name", "phone", "address");
	my $field_i = first_index { /^$str/i } @fields;
	return $field_i;
}

sub print_fields {
	my @fields = @_;
	print join("\t", map { $_ =~ s/^"|"$//g; $_ } @fields);
	return;
}
