#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;

my @out=(5,2,8,9,4,2,7,9,4,1,6,9,0);
print "Before sort:\n";
print join(', ',@out);
my @work;
my $sh =0;
my$N=@out+0;
if($N>1){
    while($sh+2!=$N){
	$b=undef;
	for my$i(0..$N-1){
	    if($i*2+2+$sh<$N){
		if($out[$i+$sh]gt$out[$i*2+1+$sh] || $out[$i+$sh]gt$out[$i*2+2+$sh]){
	            if($out[$i*2+1+$sh]lt$out[$i*2+2+$sh]){
			($out[$i*2+1+$sh],$out[$i+$sh])=($out[$i+$sh],$out[$i*2+1+$sh]);
			$b=1;
		    }elsif($out[$i*2+2+$sh]lt$out[$i*2+1+$sh]){
			($out[$i*2+2+$sh],$out[$i+$sh])=($out[$i+$sh],$out[$i*2+2+$sh]);
			$b=1;
		    }
		}elsif($out[$i*2+2+$sh]lt$out[$i*2+1+$sh]){
		    ($out[$i*2+1+$sh],$out[$i*2+2+$sh])=($out[$i*2+2+$sh],$out[$i*2+1+$sh]);
		    $b=1;
		}
	    }elsif($i*2+1+$sh<$N && $out[$i+$sh]gt$out[$i*2+1+$sh]){
		($out[$i+$sh],$out[$i*2+1+$sh])=($out[$i*2+1+$sh],$out[$i+$sh]);
		$b=1;
	    }
	}
	++$sh if!$b;
	last if$sh+2==$N;
    }
}
print "\nPiramidal sort:\n";
print join(', ',@out);

@out=(5,2,8,9,4,2,7,9,4,1,6,9,0);
sub sortM{
    my($array,$first,$last)=@_;
    if($last>$first){
	my$middle=int(($last+$first)/2);
	sortM($array,$first,$middle);
	sortM($array,$middle+1,$last);
	my$j=0;
	$work[$j++]=$$array[$_]for($first..$last);
	$middle=int(($first+$last)/2)if($middle>$last);
	my$n=$middle-$first+1;
	for(my $i=$first,$j=0,my $k=$n;$i<=$last;$i++){
	    if(($j<$n)&&(($k==(($last-$first)+1))||($work[$j]lt$work[$k]))){
		$$array[$i]=$work[$j++]
	    }else{
		$$array[$i]=$work[$k++];
	    }
	}
    }
}
sortM(\@out,0,$#out);
print "\nMerge sort:\n";
print join(', ',@out);

@out=(5,2,8,9,4,2,7,9,4,1,6,9,0);
sub sortQ{
    my($s, $e) = @_;
    my $m = $s - 1;
    for($s..$e - 1){
	if($out[$_] lt $out[$e]){
	    ++$m;
	    ($out[$m], $out[$_]) = ($out[$_], $out[$m]);
	}
    }
    ++$m;
    ($out[$m], $out[$e]) = ($out[$e], $out[$m]);
    sortQ($s, $m-1) if $s < $m-1;
    sortQ($m+1, $e) if $m+1 < $e;
}
sortQ(0, $#out);
print "\nQuick sort:\n";
print join(', ',@out);
print "\n";
