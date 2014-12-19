#!/usr/bin/perl

if ( $ARGV[0] eq 'add') 
	{ addphone();} 
elsif ( $ARGV[0] eq 'print') 
	{ printphone();} 
elsif ( $ARGV[0] eq 'delete') 
	{ deletephone();} 
else 
	{ print "Error";}

	
sub addphone
{
$str = $ARGV[1]."\t".$ARGV[2];
$flag = 0;
open FIL,"<telephone.txt";
while (defined (my $line = <FIL>))
{
if ($line eq $str)
{$flag = 1;
last;}
}
if ($flag == 1){ print "such a record already exists"; close(FIL);}
else {
close (FIL);
open FIL,"<telephone.txt";
$str1 = $ARGV[1]."\t".$ARGV[2]."\n";
while (defined (my $line = <FIL>))
{
if ($line eq $str1)
{$flag = 2;
last;}
}
if ($flag == 2){ print "such a record already exists"; close(FIL);}
else{
close(FIL);
open FIL,">>telephone.txt";
print FIL "\n".$str; close(FIL);
print "the number is added";}
}
}	
	

sub deletephone
{
	$str = $ARGV[1]."\t".$ARGV[2];
	$flag = 0;
	open FIL,"<telephone.txt";
	@outfile;
	while (defined (my $line = <FIL>))
	{
		if ($line ne $str){
			$outfile = $outfile.$line;
		}
		else {$flag = 1;}
	}
	if($flag == 1){
		close(FIL);
		open FIL,">telephone.txt";
		chomp $outfile;
		print FIL $outfile; close(FIL);return;}
	else {
		$str = $ARGV[1]."\t".$ARGV[2]."\n";
		open FIL,"<telephone.txt";
		@outfile1;
		while (defined (my $line = <FIL>))
		{
			if ($line ne $str){
				$outfile1 = $outfile1.$line;
			}
			else {$flag = 1;}
		}
		if($flag == 1){
			close(FIL);
			open FIL,">telephone.txt";
			chomp $outfile1;
			print FIL $outfile1; close(FIL);}
		else {print "there is not such record";}
	}
}

sub printphone{
$str = $ARGV[1]."\t";
$flag = 0;
open FIL,"<telephone.txt";
while (defined (my $line = <FIL>))
	{
		if ((index $line, $str)!=-1){
			$flag = 1;
			print $line;
		}
	}
	if ($flag == 0){print "there is not such record";}
	return;
}
