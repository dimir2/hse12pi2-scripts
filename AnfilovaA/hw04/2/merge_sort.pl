#!/usr/bin/perl

use Data::Dumper qw(Dumper);

@out=(5,2,8,9,4,2,7,9,4,1,6,9,0);
sub sortM
{
    my ($array, $first, $last) = @_;
    if($last > $first)
    {
	my $middle = int (($last + $first) /2);
	sortM ($array, $first, $middle);
	sortM ($array, $middle+1, $last);
	my $j = 0;
	for ($first..$last)
	{	
	   $work[$j++] = $$array[$_];
	}
	if ($middle > $last)
	{
	   $middle = int (($first + $last) /2);
	}
	my $n = $middle - $first + 1;
	for($i = $first, $j = 0,$k = $n; $i <= $last; $i++){
	    if(($j  < $n) && (($k == (($last - $first) + 1)) || ($work[$j] lt $work[$k])))
	    {
		$$array[$i] = $work[$j++]
	    }
	    else
            {
		$$array[$i] = $work[$k++];
	    }
	}
    }
}
sortM(\@out,0,$#out+1);
print Dumper (\@out);
