#!/usr/bin/perl

$name = $ARGV[0];
$surname = $ARGV[1];
$flag = 0;
$str;
$post;
open NAMES,"<names.txt";
while (defined (my $line = <NAMES>))
{
if ((index $line, $name)!=-1 and (index $line, $surname)!=-1)
{$str = $line;
$flag = 1;
last;}
}
if ($flag == 0)
{
print "there is not such name";
}
else{
close(NAMES);
open POST,"<postcards.txt";
$l= length $str;
$x = substr $str, $l-3, 1;
$y = 0;
while (defined (my $line1 = <POST>))
{
if($y == 1){$post = $line1; last;}
if ((index $line1, $x)!=-1)
{$y=$y+1;}
}
$x = substr $str, 0, 1;
if ($x eq "f")
{
substr $post, 0, 18, "Уважаемая";
}
substr $str, 0, 2, "";
substr $str, $l-5, 5, "";
$n = index $str, "\t";
substr $str, $n, 1, " ";
substr($post, 19, 21) = $str;
print $post;
}
