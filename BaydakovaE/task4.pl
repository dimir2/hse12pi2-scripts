#!usr/bin/perl

use locale;
use Data::Dumper qw(Dumper);

print "Enter add for adding record, see for show record, del for delete record";

my $char=<>;
my $FILE;
chomp ($char);
if ($char eq 'add')
 {
    add();
 }
elsif ($char eq 'see')
 {
    see();
 }
elsif ($char eq 'del')
 {
    del();
 }
sub add
 {
    open ($FILE, '>>book.txt') or die ("Open file error!");
    print "Enter name and number: ";
    my $data=<>;

    print $FILE $data;
    close $FILE;
 }

sub see
 {
    open (my $FI, '<book.txt') or die ("Open file error!");
    print "Enter name: ";
    my $name=<>;
    chomp ($name);
    my $line;
    while ($line = <$FI>)
     {
       if ($line =~ /$name/)
        {
           print $line;
        }
     }
    close $FI;  
 }

sub del
 {
    open (my $FI, '<book.txt') or die ("Open file error!");
    print "Enter name: ";
    my $name=<>;
    chomp ($name);
    my @line=grep !/$name/, <$FI>;
    #print Dumper(\@line);  
    close $FI;
    open (my $F, '>book.txt') or die ("Open file error!");
    for my $pr (@line)
    {
      print $F $pr;
    }
    close $F;
 }
