#!/usr/bin/perl

use 5.8.8;
use strict;
use warnings;
use locale;
use Switch;

sub helper
{
  print
"Keys:         For getting:
   add             add
   find            find&read
   del             delete
   help            help\n";
  exit;
}
sub del 
{
	open(my $rf, '<book.txt') or die ("Can't open rfile");
	open(my $wf, '>wbook.txt') or die ("Can't open wfile");
	my ($input) = @_;
        if($input eq " ")
        {
          print "ERROR!";
          exit;
        }
	$input = '*' . $input . '*';
	my $flag = 0;

	while ($_ = <$rf>) 
        {
           if (/$input/) 
           {
             print "Removed(";
	     $flag = 1;
	   }
	   unless (/$input/) 
           {
	     print $wf $_;
	   }
	 }
	 if ($flag == 0) 
         {
	   print "Doesn't exist!";
	 }
	 close $rf;
	 close $wf;
	 rename 'wbook.txt', 'book.txt';
}

sub show 
{
   	open(my $fh, '<book.txt') or die ("Can't open rfile");
	my ($input) = @_;
	
	while ($_ = <$fh>) 
	{
	  chomp $_;
	  if (/$input/) 
          {
	    print $_;
	  }
	}
	close $fh;		
}

sub add
{
        my $input;
	open(my $fh, '>>book.txt') or die ("Can't open rfile");
	print "Input the name:";
	$input = <STDIN>;
	chomp $input;
	print $fh '*';
	print $fh $input;
	print $fh '*';
	print "\nInput the phone number:";
	$input = <STDIN>;
	print $fh $input;
	close $fh;
	print "\nAdded)";
}

##########   main  ##############

if (scalar @ARGV == 0)
{
  print "Wrong parametrs!\n";
  helper();
  exit;
}

my $fun=$ARGV[0]; 
chomp $fun;
my $num;

switch($fun)
{
  case "add"      {add();}
  case "find"     {print"Enter the name for searching: ";
                        $num = <STDIN>;
	                chomp $num;
                        show($num);}
  case "del"      {print"Enter the name for deleting: ";
                        $num = <STDIN>;
	                chomp $num;
                        del($num);}
  case "help"     {helper();}
  else            {helper();}
}

exit;
