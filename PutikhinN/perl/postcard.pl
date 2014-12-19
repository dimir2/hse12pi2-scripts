#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Getopt::Long qw(GetOptions);
Getopt::Long::Configure ("bundling", "ignorecase_always");

my $data_fname;
my $template_fname;
my $prefix;
my $relationship_mode = "inc";
our $verbose = 0;
our $warnings = 0;
our $strict = 0;

unless (GetOptions(
	'd|data=s' => \$data_fname,
	't|template=s' => \$template_fname,
	'p|prefix=s' => \$prefix,
	'r|relationship=s' => \$relationship_mode,
	'v|verbose!' => \$verbose,
	'w|warnings!' => \$warnings,
	's|strict' => \$strict,
	'help' => sub { print_help(); exit; }
)) {
	print_usage();
	exit;
}

unless (defined $data_fname) {
	print_error_and_exit("data file is not defined");
}
unless (defined $template_fname) {
	print_error_with_usage_and_exit("template file is not defined");
}

unless ($relationship_mode =~ /^(inc|dec)$/) {
	print_error_with_usage_and_exit("'$relationship_mode' - wrong relationship mode");
}

generate_postcards_to_files($data_fname, $template_fname, $relationship_mode, $prefix);
exit;

sub print_help {
	my $help = <<'END_HELP';
Parameters:
	-d, --data=FILENAME		file to use for data
	-t, --template=FILENAME		file to use as a template
	-p, --prefix=STRING		prefix for result filename
	-r, --relationship=inc|dec	increase or decrease missing relationships
	    				in wishlist (default - increase)
	-w, --warnings			warn about problems
	    --nowarnings		supress warnings
	-s, --strict			give errors instead of warnings
	-v, --verbose			explain what is being done
	    --noverbose			suppress verbose output
	    --help			display this help and exit

	Resulting files will be created with names from following template:
	[prefix_]recepient[.template_extension]

	Examples:
	postcard.pl --data=data/new_year_data.txt --template=data/template.txt
	postcard.pl -d data/new_year_data.txt -t data/template2.html -o card
END_HELP
	print $help;
	return;
}

sub print_error_with_usage_and_exit {
	my $error = $_[0];
	print_error($error);
	print_usage();
	exit;
}

sub print_error_and_exit {
	my $error = $_[0];
	print_error($error);
	exit;
}

sub print_error {
	my $error = $_[0];
	say "$0: Error: $error";
	return;
}

sub print_usage {
	say "Try $0 --help for usage info.";
	return;
}

sub say_verbose {
	my $msg = $_[0];
	if ($verbose) {
		say $msg;
	}
	return;
}

sub say_warning {
	my $warning = $_[0];
	if ($strict) {
		print_error_and_exit($warning . " (strict mode)");
	}
	if ($warnings) {
		say "$0: Warning: $warning";
	}
	return;
}

sub write_to_file {
	my $prefix = $_[0];
	my $name = $_[1];
	my $extension = $_[2];
	my $contents = $_[3];

	my $fname = $name;
	if (defined $prefix) {
		$fname = $prefix . "_" . $fname;
	}
	if (defined $extension) {
		$fname = $fname . $extension;
	}

	$fname = lc($fname);
	$fname =~ s/ /_/g;
	say_verbose("Writing to \"$fname\"...");

	open(my $file_out, ">", $fname)
		or print_error_and_exit("can't open file $fname for writing: $!");

	for my $line (@$contents) {
		print $file_out $line;
	}

	close($file_out);

	say_verbose("...done");
	return;
}

sub generate_postcards_to_files {
	my $data_fname = $_[0];
	my $template_fname = $_[1];
	my $relationship_mode = $_[2];
	my $prefix = $_[3];
	
	my $rel_inc = ($relationship_mode eq "inc");
	my ($extension) = $template_fname =~ /(.[^.]+)$/;

	say_verbose("Reading data from \"$data_fname\"");
	open(my $data_in, "<", $data_fname)
		or print_error_and_exit("can't open file $data_fname for reading: $!");
	
	my $holiday;
	my @wishlist = ();
	my @recepients = ();

	my $parsing = "normal";
	my $str_ctr = 0;
	while (my $row = <$data_in>) {
		++$str_ctr;
		chomp $row;
		if (length $row == 0) {
			next;
		}
		if ($parsing eq "normal") {
			my @splitted = split(" ", $row);
			if (lc($splitted[0]) eq "holiday") {
				say_verbose("line $str_ctr: found holiday");
				shift @splitted;
				$holiday = join(" ", @splitted);
			} elsif (lc($splitted[0]) eq "wishlist") {
				say_verbose("line $str_ctr: found wishlist");
				$parsing = "wishlist";
			} elsif (lc($splitted[0]) eq "recepients") {
				say_verbose("line $str_ctr: found recepients");
				$parsing = "recepients";
			} else {
				say_warning("line $str_ctr: unknown string in data file");
			}
		} elsif ($parsing eq "wishlist") {
			my @splitted = split("\t", $row);
			if (lc($splitted[0]) eq "wishlist_end") {
				$parsing = "normal";
				say_verbose("line $str_ctr: found wishlist end");
				next;
			}
			my $rel_level = shift @splitted;
			my $wish = join("\t", @splitted);
			say_verbose("line $str_ctr: found wish: $rel_level\t$wish");

			push @wishlist, [$rel_level, $wish];
		} elsif ($parsing eq "recepients") {
			my @splitted = split("\t", $row);
			if (lc($splitted[0]) eq "recepients_end") {
				$parsing = "normal";
				say_verbose("line $str_ctr: found recepients end");
				next;
			}
			my $gender = lc(shift @splitted);
			unless ($gender =~ /^(m|f)$/) {
				say_warning("invalid gender - \"$gender\"");
				$gender = "m";
			}
			my $rel_level = pop @splitted;
			my $name = join("\t", @splitted);
			say_verbose("line $str_ctr: found recepient: $gender\t$name\t$rel_level");
			push @recepients, [$gender, $name, $rel_level];
		} else {
			print_error_and_exit("unknown data parsing mode - $parsing");
		}
	}
	unless (defined $holiday) {
		print_error_and_exit("could not find holiday in data file");
	}
	if (scalar @wishlist == 0) {
		say_warning("wishlist is empty");
	}
	if (scalar @recepients == 0) {
		say_warning("recepient list is empty");
	}
	close($data_in);
	@wishlist = sort { $a->[0] <=> $b->[0] } @wishlist;
	for my $recepient (@recepients) {
		my $gender = $recepient->[0];
		my $name = $recepient->[1];
		my $rel_level = $recepient->[2];
		my $wish;
		if ($wishlist[0]->[0] == $rel_level) {
			$wish = $wishlist[0]->[1];
		} else {
			for my $wish_i (1 .. $#wishlist) {
				my $cur_rel = $wishlist[$wish_i]->[0];
				my $prev_rel = $wishlist[$wish_i-1]->[0];
				if (($cur_rel == $rel_level)
					|| ($wish_i == $#wishlist)
				) {
					$wish = $wishlist[$wish_i]->[1];
					last;
				}
				if(($cur_rel > $rel_level) && ($prev_rel < $rel_level)) {
					if ($rel_inc) {
						$wish = $wishlist[$wish_i]->[1];
					} else {
						$wish = $wishlist[$wish_i-1]->[1];
					}
					last;
				}
			}
		}
		say_verbose("Generating postcard for $name with wish \"$wish\"");
		my $postcard = generate_postcard($gender, $name, $wish, $holiday, $template_fname);
		write_to_file($prefix, $name, $extension, $postcard)
	}
	return;
}

sub generate_postcard {
	my $gender = $_[0];
	my $name = $_[1];
	my $wish = $_[2];
	my $holiday = $_[3];
	my $template_fname = $_[4];

	open (my $in, "<", $template_fname)
		or print_error_and_exit("can't open file $template_fname for reading: $!");
	my @result = ();
	while (my $row = <$in>) {
		$row =~ s/%holiday%/$holiday/g;
		$row =~ s/%name%/$name/g;
		$row =~ s/%wish%/$wish/g;
		my $gender_regex = "%gender\?[^%]*%"; 
		my (@gender_subs) = $row =~ /$gender_regex/g;
		my @substituted = ();
		for my $gender_sub (@gender_subs) {
			my $sub = substitute_gender($gender_sub, $gender);
			push @substituted, $sub;
		}
		while ($row =~ /$gender_regex/) {
			my $sub = shift @substituted;
			$row =~ s/$gender_regex/$sub/;
		}
		push @result, $row;
	}
	close($in);
	return \@result;
}

sub substitute_gender {
	my $sub = $_[0];
	$sub =~ s/^%|%$//g;
	my $gender = $_[1];
	my @splitted = split(/\?/, $sub);
	if (scalar @splitted != 2) {
		say_warning("invalid %gender% substitution - $sub");
		return " ";
	}
	my $val = $splitted[1];
	@splitted = split(":", $val);
	if (scalar @splitted != 2) {
		say_warning("invalid %gender% substitution - $sub");
		return " ";
	}
	if ($gender eq "m") {
		return $splitted[0];
	} else {
		return $splitted[1];
	}
}
