#!/usr/bin/perl

@array=(20, 30, 15, 18, 17, 5, 40, 30, 27, 100, 63, 48, 26, 15, 5);
print "@array\n";
my $size = @array;
heapsort(\@array,$size);
print "@array\n";

sub swap {
	my($array,$x,$y) = @_;
	my $tmp = 0;
	$tmp=@array[$x];
	@array[$x]=@array[$y];
	@array[$y]=$tmp;
}

sub heapsort
{
	my($array,$n)=@_;
	my $i = 0;
	my $sh = 0;
	my $b = 0;
	while (1)
	{
		$b = 0;
		for ($i = 0; $i < $n; $i++)
		{
			if ($i*2 + 2 + $sh < $n)
			{
				if (@array[$i+$sh] > @array[$i*2 + 1 + $sh] or @array[$i + $sh] > @array[$i*2 + 2 + $sh])
				{
					if (@array[$i*2+1+$sh] < @array[$i*2+2+$sh])
					{
						swap (\@array, $i+$sh, $i*2+1+$sh);
						$b = 1;
					}
					elsif (@array[$i*2+2+$sh] < @array[$i*2+1+$sh])
					{
						swap (\@array, $i+$sh,$i*2+2+$sh);
						$b = 1;
					}
				}
			}
			elsif ($i * 2 + 1 + $sh < $n)
			{
				if (@array[$i+$sh] > @array[$i*2+1+$sh])
				{
					swap (\@array, $i+$sh, $i*2+1+$sh);
					$b=1;
				}
			}
		}
    if (!$b) {$sh++;}
    if ($sh+2>=$n)
      {last;}
  } 
}