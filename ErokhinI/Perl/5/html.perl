#!/usr/bin/perl

open (file, "people.txt");
@content = <file>;
close file;

foreach $i (@content)
{
	($key, $name) = split(/ /,$i);
	if($key eq "1")
	{
		my_sub($key,$name);
	}
	if($key eq "2")
	{
		my_sub($key,$name);
	}
	if($key eq "3")
	{
		my_sub($key,$name);
	}
	if($key eq "4")
	{
		my_sub($key,$name);
	}
	if($key eq "5")
	{
		my_sub($key,$name);
	}
	if($key eq "6")
	{
		my_sub($key,$name);
	}
	if($key eq "7")
	{
		my_sub($key,$name);
	}
	if($key eq "8")
	{
		my_sub($key,$name);
	}
	if($key eq "9")
	{
		my_sub($key,$name);
	}
	if($key eq "10")
	{
		my_sub($key,$name);
	}
}

sub my_sub
{
	open (file, "template/".@_[0].".txt");
	@text = <file>;
	close file;

	open file, '>ready/'.@_[1].'.html';
	print file "<html>";
	print file "<head>";
	print file "<title>Happy New Year!</title>";
	print file "</head>";
	print file "<body>";
	print file "<H1>Dear ".@_[1]."!</H1>";
	print file "<P><i>";
	foreach $i (@text)
	{
		print file $i;
		print file "<br>";
	}
	print file "</i></P>";
	print file "</body>";
	print file "</html>";
	close file;
}
