#!/usr/bin/perl

open( file, "databaseofpeople.txt" );
@string = <file>;
close file;

print "Who do you want to congrats? Enter first name or secound name\n";

foreach $i (@string)
{
($sex,$fname,$sname,$cheer) = split(/ /,$i);
print $fname;
print " ";
print $sname;
print "\n";
}
my $enter;
chomp ($enter = <STDIN>);

foreach $i (@string)
{
	($sex,$fname,$sname,$cheer) = split(/ /,$i);
	if ($sname eq $enter || $fname eq $enter){
		congrats($sex,$fname,$sname,$cheer);
	}

}

sub congrats
{
	open (file, "pattern.txt");
	@string = <file>;
	close file;

	
	open file, ">congrats.html";
	print file "<html>\n\t";
	print file "<head>\n\t\t";
	print file "<title>Happy New Year!</title>\n\t";
	print file "</head>\n\t";
	print file "<body>\n\t\t";
	if(@_[0] eq male){ print file "<H1>Dear ".@_[1]." ".@_[2]."!</H1>\n\t\t";}
	else{print file "<H1>Sweetheart ".@_[1]." ".@_[2]."!</H1>\n\t\t";}
	print file "<P><font color=red>";
	foreach $q (@string)
	{
		chomp(@_[3]);
		($cheer_pat,$pattern) = split(/ /,$q,2);
		if(@_[3] eq $cheer_pat){chomp($pattern); print file $pattern;}
	}
	print file "</P></font>\n\t";
	print file "</body>\n";
	print file "</html>";
	close file;
	
}
