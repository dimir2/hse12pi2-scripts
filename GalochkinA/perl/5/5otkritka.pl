#!/usr/bin/perl
use 5.18.2;
use strict;
use warnings;

my $filename = "datafor.txt";
my $filename2 = "otkritka.html";
my $filenameoutput = "otkritkaForYou.html";
my $razdelitel = "<splituem>";
my $bool = 0;
my $fh;
my $row;
my @name;

open($fh, '<:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";
while ( $row = <$fh>) {
chomp $row;
@name = split(' ',$row);
}
close $fh;

open($fh, '<:encoding(UTF-8)', $filename2)
or die "Could not open file '$filename2' $!";
my @bd;
my @br;
while ( $row = <$fh>) {
chomp $row;
if ($row eq $razdelitel){
$bool = 1;
}
if($bool == 0){
push @bd, sprintf("%s", $row);
}
else{
push @br, sprintf("%s", $row);
}
}
close $fh;

open($fh, '>:encoding(UTF-8)', $filenameoutput)
or die "Could not open file '$filename' $!";
print $fh join("\n",@bd);
if($name[0] eq '0'){
print $fh "Uvajaemii ";
}
else{
print $fh "Uvajaemaya ";
}
print $fh "$name[1] ";
print $fh "$name[2], <br />";
;
if($name[3] eq 0){
print $fh "...";
}
if($name[3] eq 1){
print $fh "...";
}
if($name[3] eq 2){
print $fh "S novim godom.";
}
if($name[3] eq 3){
print $fh "S novim godom!:)";
}
if($name[3] eq 4){
print $fh "S novim godom!<br /> s4ast'ya";
}
if($name[3] eq 5){
print $fh "S novim godom!<br /> Uda4i i prozvitaniya v novom godu";
}
if($name[3] eq 6){
print $fh "S novim godom!<br /> S4ast'ya, zdorovia i uda4i v novom godu";
}
if($name[3] eq 7){
print $fh "Jelau vstretit Novii god<br />
Veseliem shumnim i s razmahom.";
}
if($name[3] eq 8){
print $fh "Jelau vstretit Novii god<br />
Veseliem shumnim i s razmahom.<br />
Pust' prazdnik radost' prineset,<br />
I eto budet dobrim znakom.";
}
if($name[3] eq 9){
print $fh "Jelau vstretit Novii god<br />
Veseliem shumnim i s razmahom.<br />
Pust' prazdnik radost' prineset,<br />
I eto budet dobrim znakom.<br />
Jelaem yarkih perspectiv,<br />
Udachi, smelih na4inanii.";
}
if($name[3] eq 10){
print $fh "Jelau vstretit Novii god<br />
Veseliem shumnim i s razmahom.<br />
Pust' prazdnik radost' prineset,<br />
I eto budet dobrim znakom.<br />
Jelaem yarkih perspectiv,<br />
Udachi, smelih na4inanii.<br />
Pust' v zhizni budet pozitiv<br />
I mnogo sbivshihsya zhelanii!<br />";
}
close $fh;

