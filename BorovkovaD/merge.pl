#!/usr/bin/perl

@array=(20, 30, 15, 18, 17, 5, 40, 30, 27);
print "@array\n";
sortmerge(\@array,0,$#array+1);
print "@array";


sub swap {
	my($array,$x,$y) = @_;
	my $tmp = 0;
	$tmp=@array[$x];
	@array[$x]=@array[$y];
	@array[$y]=$tmp;
}

sub sortmerge 
{
	my($array,$first,$last)=@_;
	my $left = $first;
	my $right = $last;
	my $med=int(($left+$right)/2);	
	my $n=@array[$med];
	while ( $left <= $right)
	{
		while ( @array[$left] < $n )
		{
			$left=$left+1;
		}
		while ( @array[$right] > $n)
		{
			$right=$right-1;
		}
		if ( $left <= $right )
		{
			if (@array[$left] > @array[$right])
			{
				swap (\@array,$left,$right);
			}
		$left=$left+1;
		$right=$right-1;
		}
	}
		if ( $left < $last )
		{
			sortmerge (\@array,$left,$last);
		}
		if ( $first < $right )
		{
			sortmerge (\@array,$first, $right);
		}
    }
