#!/usr/bin/perl

use Data::Dumper qw(Dumper);

for($i = 0; $i<=100; $i++)
{
	$arr[$i]=int(rand(51))+21;
}

print Dumper(\@arr);

sub MergeSort
{
	my($array,$first,$last) = @_;
	if($last>$first)
	{
		my $middle = int(($last+$first)/2);
		MergeSort($array,$first,$middle);
		MergeSort($array,$middle+1,$last);
		my $j = 0;
		$work[$j++] = $$array[$_]for($first..$last);
		$middle = int(($first+$last)/2)if($middle>$last);
		my $n = $middle-$first+1;
		for($i=$first,$j=0,$k=$n;$i<=$last;$i++)
		{
	    		if(($j<$n)&&(($k==(($last-$first)+1))||
					($work[$j]lt$work[$k])))
			{
				$$array[$i]=$work[$j++]
	    		}
			else
			{
				$$array[$i]=$work[$k++];
	    		}
		}
    	}
}

MergeSort(\@arr,0,$#arr+1);

print Dumper(\@arr);

