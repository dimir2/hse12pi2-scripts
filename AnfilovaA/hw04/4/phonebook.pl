#!/usr/bin/perl

use warnings;
use 5.010;
use Switch;
use Data::Dumper qw(Dumper);

	switch ($ARGV[0]) {
		case "del" {shift; &del(@ARGV)}
		case "add" {shift; &add(@ARGV)}
		case "show"{shift; &show(@ARGV)}
		case "help"{&help()}
		else { say "Undentified instraction"; }
	}

sub del
{
	#Для чтения строк из файла используется файловый манипулятор "поставленный" в <>.
	my @item = @_;
        if ($#item == -1)
	{
	   say "no arguments";
	   exit -1;
	} 
		
	open (DB,'<:encoding(UTF-8)', 'database.txt')
	or die "Could not open the file 'database.txt' $!";
	my @database = <DB>;
	close DB;

	open (DB,'>', 'database.txt')
	or die "Could not open the file 'database.txt' $!";

	foreach $row (@database)
	{
	   chomp $row; # отрезается спецсимвол от переменной $_
	   @array = split /[,\s]\s*/, $row;
	   
	   if ($array[0] ne $item[0])
	   {
	      say DB join (" ", @array); 
	   }
	}
	close DB;
}

sub add
{
	my @item = @_;
        if ($#item < 1)
	{
	   say "not enough arguments";
	   exit -1;
	} 

	if ($item[1] =~ /^[0-9]+$/)
	{
	   open (DB,'>>', 'database.txt')
	   or die "Could not open the file 'database.txt' $!";
	   print DB "$item[0] $item[1]";
	   close DB;
	}
	else
	{
	   say "second argument is not a number!";
	   exit -1;	
	}
}

sub show
{
	open (DB,'<', 'database.txt')
	or die "Could not open the file 'database.txt' $!";
	my @database = <DB>;
	close DB;
	
	my @item = @_;
        if ($#item == -1)
	{
	    print @database;
	    exit 0;
	} 
	
	
	foreach $row (@database)
	{
	   chomp $row; # отрезается спецсимвол от переменной $_
	   @array = split /[,\s]\s*/, $row;
	   if ($array[0] eq $item[0] || $array[1] eq $item[0])
	   {
	      say join (" ", @array); 
	      exit 0;
	   }
	}
	say "there are no such person and number in the phonebook";
}

sub help
{
	say "enter 'del <number> or <name>' to delete from phonebook";
	say "enter 'add <name> <number>' to add number to phonebook";
	say "enter 'show <name>' to know a number";
	say "enter 'show' to see a whole phonebook.";
}
