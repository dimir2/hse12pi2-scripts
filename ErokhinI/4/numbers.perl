#!/usr/bin/perl

if($ARGV[0] eq "all")
{
	open (file, "numbers.txt");
	@content = <file>;
	print $_ foreach (@content);
	close file;
}

if($ARGV[0] eq "add")
{
	open file, '>>numbers.txt';
	print file $ARGV[1];
	print file " ";
	print file $ARGV[2];
	print file "\n";
	close file;
}

if($ARGV[0] eq "del")
{
	open (file, "numbers.txt");
	@content = <file>;
	close file;

	open file, '>numbers.txt';
	foreach $i (@content)
	{
		($name, $phone) = split(/ /,$i);
		if($name ne $ARGV[1])
		{
			print file $i;
		}
	}
	close file;
}

if($ARGV[0] eq "show")
{
	open (file, "numbers.txt");
	@content = <file>;
	close file;

	foreach $i (@content)
	{
		($name, $phone) = split(/ /,$i);
		if($name eq $ARGV[1])
		{
			print $i;
		}
	}
}
