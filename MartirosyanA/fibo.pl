#!/usr/bin/perl
sub fibonacci {
my $n = shift; 
$n < 3 ? 1: fibonacci($n - 1) + fibonacci($n - 2)
}

sub factorial 
{
my $m = shift;
if ($m==0)
{ return 1;
}
else {
return $m*factorial($m-1);
}}

print "factorial:", factorial ($ARGV[0]),"\n" ;
print "fibonacci:";
foreach (1..$ARGV[0])
{ print fibonacci($_), " ";
}

