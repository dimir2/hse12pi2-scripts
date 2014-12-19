#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use locale;
use utf8;

binmode(STDOUT,':utf8');


my $filename = 'text.txt';
my $fh;


sub add{
print "Введите строку:\n";
my $input = <>;
chomp $input;
open($fh, '<:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";

my @bd; 

while (my $row = <$fh>) {
chomp $row;
push @bd, sprintf("%s", $row);
}
close $fh;
push @bd, sprintf("%s", $input);
open($fh, '>:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";
print join("\n",@bd);
print $fh join("\n",@bd);
close $fh;
}

sub remove{
print "Введите имя для удаления:";
my $input = <>;
chomp $input;

open($fh, '<:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";
my @br; 
my $boolean=0;
while (my $row = <$fh>) {
chomp $row;
$boolean = 0;
my @name = split(' ',$row);
foreach my $i(@name){
if($i eq $input){
$boolean =1;
}
}
if($boolean==0){
push @br, sprintf("%s",$row);
}
}
close $fh;
open($fh, '>:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";
print $fh join("\n",@br);
close $fh;
}

remove();
print "\ndone\n";
