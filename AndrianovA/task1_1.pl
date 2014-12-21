#!/usr/bin/perl

	use 5.18.2;
	use strict;
	use warnings;

	print "factorial=",fact(shift),"\n";
	print "fibonacci=",fib(shift),"\n";

	####################### recursion factorial ##############################


	
	sub fact {

 	 	my $input = shift;
		
 	 	$input == 0 ? 1 : $input*fact($input-1);
	}
	
	######################## fibonacci ##################################
	
	
	sub fib{
		my $input1 = shift;

		$input1 <3 ? 1: fib($input1-1) + fib($input1-2);
	}
	
	
