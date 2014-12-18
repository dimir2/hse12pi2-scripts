#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
#
#	5. Написать телефонную/адресную книгу, 
#	   используя текстовый файл в качестве БД,
#	   реслизовать следующие запросы
#	     * добавить запись
#	     * удалить запись
#	     * просмотреть запись по шаблону
#

sub add {
my $filename = "book.txt";
open(my $FH, ">>", $filename);
print "Введите запись в формате:\n<имя> <фамилия> <телефон>\n";
my $UsWant = <STDIN>;
my $old_point=select($FH); #Пишем в файл
print $UsWant;
select($old_point); #Пишем в <STDOUT>
print "Запись прошла успешно.\n";
}

sub del {
print "Введите запись в формате:\n<имя> <фамилия> <телефон>\n";
my $filename = "book.txt";
open(my $FH, "<", $filename);
my @strings=<$FH>;
close($FH);
chomp (my $UsWant = <STDIN>);
my $i = 0;
foreach my $line (@strings) {
	if($line =~ /$UsWant/ ) {
		splice( @strings, $i, 1);
	}
$i++;
}
open($FH, ">", $filename);
my $old_point=select($FH); #Пишем в файл
print @strings;
select($old_point); #Пишем в <STDOUT>
print "Удаление прошло успешно.\n";
}

sub get {
my $filename = "book.txt";
open(my $FH, "<", $filename);
print "Введите запись в формате:\n<имя> или <фамилия> или <телефон> или ничего для отображения всей книги\n";
chomp (my $UsWant = <STDIN>);
if ( $UsWant eq "") {
	my @strings=<$FH>;
	foreach my $line (@strings) {
		print $line;
	}
} else {
	my @strings=<$FH>;
	foreach my $line (@strings) {
		if($line =~ /$UsWant/ ) {
			print $line;
		}
	}
}
}

sub main {
print "Введите add если хотите добавить запись.\nВведите del если хотите удалить запись.\nВведите get если хотите просмотреть записи.\nEND если хотите выйти из программы.\n";
my $x = 1;
while( $x ) {
	my $whatUsWant;
	chomp ($whatUsWant = <STDIN>);
	given($whatUsWant) {
		when("add") { add(); }
		when("del") { del(); }
		when("get") { get(); }
		when("END") {$x = 0;}
		default { print "None of the expected values\n"; }
}


}
}

my $filename = "book.txt";
open(my $fh, "<", $filename)
	or die "Could not open file '$filename' $!";
close($fh);
main();
__END__
