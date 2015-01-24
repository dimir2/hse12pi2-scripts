#!/usr/bin/perl

use Data::Dumper qw(Dumper);

for($i = 0; $i<=100; $i++)
{
	$arr[$i]=int(rand(51))+21;
}

print Dumper(\@arr);

sub PiramidSort
{
	my($arr) = @_;
	$N = @arr+0;
	if($N>1)
	{
    		while($sh+2!=$N)
		{
			$b=undef;
			for my $i(0..$N-1)
			{
	    			if($i*2+2+$sh<$N)
				{
					if($arr[$i+$sh]gt$arr[$i*2+1+$sh] || $arr[$i+$sh]gt$arr[$i*2+2+$sh])
					{
	            				if($arr[$i*2+1+$sh]lt$arr[$i*2+2+$sh])
						{
							($arr[$i*2+1+$sh],$arr[$i+$sh])=($arr[$i+$sh],$arr[$i*2+1+$sh]);
							$b = 1;
		    				}
						elsif($arr[$i*2+2+$sh]lt$arr[$i*2+1+$sh])
						{
							($arr[$i*2+2+$sh],$arr[$i+$sh])=($arr[$i+$sh],$arr[$i*2+2+$sh]);
							$b = 1;
		    				}
					}elsif($arr[$i*2+2+$sh]lt$arr[$i*2+1+$sh])		
					{
		    				($arr[$i*2+1+$sh],$arr[$i*2+2+$sh])=($arr[$i*2+2+$sh],$arr[$i*2+1+$sh]);
		    				$b = 1;
					}
	    			}elsif($i*2+1+$sh<$N && $arr[$i+$sh]gt$arr[$i*2+1+$sh])
				{
					($arr[$i+$sh],$arr[$i*2+1+$sh])=($arr[$i*2+1+$sh],$arr[$i+$sh]);
					$b = 1;
	    			}
			}
			++$sh if!$b;
			last if$sh+2==$N;
    		}
	}
}

PiramidSort(\@arr);
print Dumper(\@arr);
