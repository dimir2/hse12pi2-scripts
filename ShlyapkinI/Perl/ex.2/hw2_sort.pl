#!/usr/bin/perl

use 5.010;
#use strict;
use warnings;
use Data::Dumper qw(Dumper);
use Scalar::Util qw(looks_like_number);

my $count = @ARGV;
if ($count != 1) {
	help();
	exit;
}

for($i = 0; $i<=100; $i++)
{
$arr[$i]=int(rand(100))-50;
}

if ("merge" =~ /$ARGV[0]/) {


	merge(\@arr, 0, scalar(@arr));
	print Dumper \@arr;

} elsif ("heap" =~ /$ARGV[0]/) {

	
	heap(\@arr);
	print Dumper \@arr;

} elsif ("buble" =~ /$ARGV[0]/) {

	
	@arr=buble(@arr);
	print Dumper \@arr;

}else {
	help();
	return;
}


sub merge{
    
	my ($array, $start, $end)=@_;

	my $num=$end-$start;

	if($num<2) {return;}
	my $half=$start+int($num/2);

	merge($array, $start, $half);
	merge($array, $half, $end);

	for(my $i=$start; $i<$half; ++$i) {
		if($$array[$i] > $$array[$half]) {
			my $v=$$array[$i];
			$$array[$i]=$$array[$half];

			my $i=$half;
			while($i<$end-1 && $$array[$i+1] < $v) {
				($$array[$i], $$array[$i+1])=
					($$array[$i+1], $$array[$i]);
				++$i;
			}
			$$array[$i]=$v;
		}
	}
}

sub heap
{
	my($list) = @_;
	my $count = scalar @$list;
	my $left = ($count - 2) / 2;
	while($left >= 0)
	{
		fun($left,$count-1,$list);
		$left--;
	}
	my $right = $count - 1;  
	while($right > 0)
	{
		@$list[0,$right] = @$list[$right,0];
		fun(0,$right-1,$list);
		$right--;
	}
}



	
sub fun
{
	my($left,$right,$list) = @_;
	my $root = $left;
	while($root * 2 + 1 <= $right)
	{
		my $child = $root * 2 + 1;
		$child++ if($child + 1 <= $right && $list->[$child] < $list->[$child+1]);
		if($list->[$root] < $list->[$child])
		{
			@$list[$root,$child] = @$list[$child,$root];
			$root = $child;
		}else{ return }
	}
}

sub buble{

    for (my $i=0;$i<=$#_;$i++){
        for (my $j=$i + 1;$j<=$#_;$j++){
            if ($_[$j] < $_[$i]) {@_[$i, $j] = @_[$j, $i];}
        }
    }
    @_;
}

 


sub help {
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "++++++++++++++++ Script + Action +++++++++++++++++++++";
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
	say "+merge ++++++++++++++merge_sort+++++++++++++++++++++++";
	say "+pir ++++++++++++++++piramid_sort+++++++++++++++++++++";
	say "+buble ++++++++++++++buble_sort+++++++++++++++++++++";
	say "++++++++++++++++++++++++++++++++++++++++++++++++++++++";
}
