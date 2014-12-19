#!/usr/bin/perl
use 5.18.2;
use strict;
use warnings;
use utf8; 

binmode(STDOUT,':utf8');
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
print $fh "Уважаемый ";
}
else{
print $fh "Уважаемая ";
}
print $fh "$name[1] ";
print $fh "$name[2],<br />";
;
if($name[3] eq 0){
print $fh "...";
}
if($name[3] eq 1){
print $fh "Поздравляю";
}
if($name[3] eq 2){
print $fh "С новым годом.";
}
if($name[3] eq 3){
print $fh "С новым годом!:)";
}
if($name[3] eq 4){
print $fh "С новым годом!<br /> счастья";
}
if($name[3] eq 5){
print $fh "С новым годом!<br /> Удачи и процвитания в новом году";
}
if($name[3] eq 6){
print $fh "С новым Годом!<br /> Счастья, здоровья и удачи в новом году!";
}
if($name[3] eq 7){
print $fh "Желаем встретить Новый год<br />
Весельем шумным и с размахом.<br />";
}
if($name[3] eq 8){
print $fh "Желаем встретить Новый год<br />
Весельем шумным и с размахом.<br />
Пусть праздник радость принесёт,<br />
И это будет добрым знаком.";
}
if($name[3] eq 9){
print $fh "Желаем встретить Новый год<br />
Весельем шумным и с размахом.<br />
Пусть праздник радость принесёт,<br />
И это будет добрым знаком.<br />
Желаем ярких перспектив,<br />
Удачи, смелых начинаний.<br />";
}
if($name[3] eq 10){
print $fh "Желаем встретить Новый год<br />
Весельем шумным и с размахом.<br />
Пусть праздник радость принесёт,<br />
И это будет добрым знаком.<br />
Желаем ярких перспектив,<br />
Удачи, смелых начинаний.<br />
Пусть в жизни будет позитив<br />
И много сбывшихся желаний!<br />";
}
close $fh;

