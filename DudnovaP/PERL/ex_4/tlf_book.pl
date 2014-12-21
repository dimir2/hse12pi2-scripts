#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $filename = 0;
print "Input filename:\n";
$filename=<STDIN>; #remember with "\n"
chomp($filename); #delete "\n"
my @words = qw(show delete add);
print "Choose what to make(show delete add)\n";
my $desicion=<STDIN>;
chomp($desicion);

if($desicion eq "show")
{
	show($filename);
	print "done\n";
}elsif($desicion eq "add")
{
	add($filename);
	print "done\n";
}elsif($desicion eq "delete")
{
	delte($filename);
	print "done\n";
}else{
	print "error: wrong word!\n";
}

sub show{
my $filename_show = $_[0];
print "Write the name for search\n";
my $name=<STDIN>;
chomp($name);
open(BASA,$filename_show) || die "can't open $filename_show: $!";
my $line = 0;
while(<BASA>)
{
	while(/$name/g)
	{
	print "found at : ".$line.":".$-[0].":".$+[0]."\n";
	print "$_\n";
	}
	$line++;
}
close(BASA) || die "can't close $filename_show: $!";
}


sub add{
my $filename_add = $_[0];
print "Write the line for add\n";
my $line=<STDIN>;
chomp($line);
open(BASA, '>>', $filename_add) || die "can't open $filename_add: $!";#> delete all, >> add
print BASA "$line\n";
close(BASA) || die "can't close $filename_add: $!";
}

sub delte{
my $filename_delete = $_[0];
print "Write the name for delete\n";
my $name=<STDIN>;
chomp($name);
open(BASA, $filename_delete) || die "can't open $filename_delete: $!";
my $line = 0;
my @arr;
my $to_delete = 0;
while(<BASA>)
{
	$arr[$line] = $_;
	while(/$name/g)
	{
	print "found at : ".$line.":".$-[0].":".$+[0]."\n";
	$to_delete=$line;
	print "$_\n";
	}
	$line++;
}
close(BASA) || die "can't close $filename_delete: $!";
open(BASA, '>', $filename_delete) || die "can't open $filename_delete: $!";
$arr[$to_delete]=0;
for(my $j=0; $j<$to_delete; $j++)
{
	print BASA "$arr[$j]";
}
for(my $k=$to_delete; $k<$line-1; $k++)
{
	$arr[$k]=$arr[$k+1];
	print BASA "$arr[$k]";
}
close(BASA) || die "can't close $filename_delete: $!";
}
#print BASA "$_\n""polina 2221070 Ribakova,8 \n";

#close(BASA) || die "can't close $filename: $!";
