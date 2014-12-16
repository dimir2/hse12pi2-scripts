#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use Data::Dumper qw(Dumper);
use Encode;

open(my $pat, '<pattern.pt') or die ("I can not open pattern.");
open(my $prof, '<profile.pf') or die ("I can not open profile.");
open(my $html, '>congrats.html') or die ("I can not open html-file.");

my $line = <$prof>;
my @array = split('~', $line);
my $felicitation = <$pat>;

$felicitation = '<HTML><HEAD><meta charset="utf8"><TITLE>Congrats!</TITLE>
        </HEAD><BODY>' . $felicitation . 
	'</BODY></HTML>';

close $pat;
close $prof;

my $resp = '<resp>';
my $name = '<name>';
my $surname = '<surname>';
my $rel = '<rel>';

while ($felicitation=~/$resp/) {
	if ($array[0] eq 'female') {
		$felicitation = $` . '<i><b>' . 'Уважаемая' . '</b></i>' . $';
	} elsif ($array[0] eq 'male') {
		$felicitation = $` . '<i><b>' . 'Уважаемый' . '</b></i>' . $';
	} else {
		$felicitation = $` . '<i><b>' . 'Уважаемое' . '</b></i>' . $';
	}
}

while ($felicitation=~/$name/) {
	$felicitation = $` . '<u><i><b>' . $array[1] . '</b></i></u>' . $';
}

while ($felicitation=~/$surname/) {
	$felicitation = $` . '<u><b>' . $array[2] . '</b></u>' . $';
}

while ($felicitation=~/$rel/) {
	if ($array[3] == 0) {
		$felicitation = $` . '<i>' . 'гореть в аду' . '</i>' . $';
	} elsif ($array[3] == 1) {
		$felicitation = $` . '<i>' . 'гореть в аду в новом году' . '</i>' . $';
	} elsif ($array[3] == 2) {
		$felicitation = $` . '<i>' . 'весь год слушать только Стаса Михайлова' . '</i>' . $';
	} elsif ($array[3] == 3) {
		$felicitation = $` . '<i>' . 'сдохнуть' . '</i>' . $';
	} elsif ($array[3] == 4) {
		$felicitation = $` . '<i>' . 'жить на одну зарплату' . '</i>' . $';
	} elsif ($array[3] == 5) {
		$felicitation = $` . '<i>' . 'чтобы всё было по кайфу' . '</i>' . $';
	} elsif ($array[3] == 6) {
		$felicitation = $` . '<i>' . 'всего хорошего' . '</i>' . $';
	} elsif ($array[3] == 7) {
		$felicitation = $` . '<i>' . 'счастья, здоровья' . '</i>' . $';
	} elsif ($array[3] == 8) {
		$felicitation = $` . '<i>' . 'счастья, здоровья, денег' . '</i>' . $';
	} elsif ($array[3] == 9) {
		$felicitation = $` . '<i>' . 'всего наилучшего, счастья, здоровья' . '</i>' . $';
	} elsif ($array[3] == 10) {
		$felicitation = $` . '<i>' . 'всего наилучшего, счастья, здоровья, много денег' . 
                        '</i>' . $';
	} else {
		$felicitation = $` . '<i>' . 'ничего' . '</i>' . $';
	}
}

print $html $felicitation;
