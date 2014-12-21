#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $i = 1;
open(BASA,"peoples.txt") || die "can't open people.txt: $!";
while(<BASA>)
{
	print "N$i. $_";
	$i++;
}
close(BASA) || die "can't close people.txt: $!";

print "Write the number, please\n";
my $number=<STDIN>;
chomp($number);
open(BASA,"peoples.txt") || die "can't open people.txt: $!";
my $line = 0;
my $stroka;
while(<BASA>)
{
	$line++;
	$stroka = $_ if($line eq $number);
}
close(BASA) || die "can't close people.txt: $!";
say $stroka;
(my $m_w,my $relation,my $name) = split(/ /,$stroka,3);
say $m_w;
say $relation;
say $name;
open(SHIP,"relationship.txt") || die "can't open relationship.txt: $!";
my $speach;
while(<SHIP>)
{
	foreach (<SHIP>)
	{
		(my $n,$speach) = split(/ /,$_,2);
		goto M1 if($n eq $relation);
	}	
}
M1:
say $speach;
close(SHIP) || die "can't close relationship.txt: $!";


open(HTML,'>',"ex_5.html") || die "can't create ex_5.html: $!";
print HTML "<html>\n";
print HTML "<head>\n";
print HTML "<title>Congradulations!</title>\n";
print HTML "</head>\n";
print HTML "<body>\n";
print HTML "<P>";
if($m_w eq "m")
{
	print HTML "<font color=blue>";
	print HTML "<H1><strong>Mr. <i><u>".$name."</u></i></strong></H1>";
	print HTML "</font>";
}else{
	print HTML "<font color=deeppink>";
	print HTML "<H1><strong>Ms. <i><u>".$name."</u></i></strong></H1>";
	print HTML "</font>";
}
print HTML "</P>\n";
print HTML "<P>";
print HTML "<font color=navy>";
print HTML "<H2>$speach</H2>";
print HTML "</font>";
print HTML "</P>\n";
print HTML "<P><img src = \"for_10.jpg\" alt=\"\"></P>" if($relation eq 10);
print HTML "<P><img src = \"for_9.jpg\" alt=\"\"></P>" if($relation eq 9);
print HTML "<P><img src = \"for_8.jpg\" alt=\"\"></P>" if($relation eq 8);
print HTML "<P><img src = \"for_7.jpg\" alt=\"\"></P>" if($relation eq 7);
print HTML "</body>\n";
print HTML "</html>";
close (HTML)|| die "can't close ex_5.html.txt: $!";
