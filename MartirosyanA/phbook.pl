#!/usr/bin/perl -w
print "input 1 to find 2 to add 3 to delete \n"; $temp1=<STDIN>;
if($temp1==1) {
$temp2=<STDIN>;
chomp $temp2;
open (PHONE, "phone.txt") || die "error :$! \n";
while (<PHONE>) {
chomp; 
($name, $phone)=split /::/, $_; 
if ($name eq $temp2 or $phone eq $temp2) {
print "surname: $name Phone: $phone \n";
}
}

close PHONE; 
};
if ($temp1==2) {
print "input the name and number \n";
$add=<STDIN>; 
chomp $add; 
open (PHONE, '>>', "phone.txt") || die "error :$! \n";
print PHONE $add, "\n";
}
if ($temp1==3) {
print "input the name u want to delete:";
$delete=<STDIN>;
chomp $delete;
open(PHONE, "phone.txt");
@my_hash = grep {!/$delete/} <PHONE>;
close PHONE;
open PHONE, ">phone.txt";
foreach (@my_hash) {
print PHONE;
}
}

