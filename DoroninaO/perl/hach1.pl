#!/usr/bin/perl

my %hash = (
   13 => 'Lunch',
   17 => 'Tea',
   20 => 'Dinner',
    9 => 'Breakfast',
);
foreach $key(sort keys %hash){
	print "$key => $hash{$key}\n"; #отсортирует в алфавитном порядке по значениям ключа
}

foreach $value(sort values %hash){
	print "$value\n"; #сортировка по значению
}
