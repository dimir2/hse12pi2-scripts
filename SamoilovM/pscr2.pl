#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;
use Data::Dumper qw(Dumper);

sub mSort {
    	my @x = @_;
    	return @x if @x < 2;
    	my $m = int @x / 2;
    	my @a = mSort(@x[0 .. $m - 1]);
    	my @b = mSort(@x[$m .. $#x]);
    	for (@x) {
        	$_ = !@a            ? shift @b
           	: !@b            ? shift @a
           	: $a[0] <= $b[0] ? shift @a
           	:                  shift @b;
    	}
    	@x;
}

sub sift_down
{
        my($start,$end,$list) = @_;
 
        my $root = $start;
        while($root * 2 + 1 <= $end)
        {
                my $child = $root * 2 + 1;
                $child++ if($child + 1 <= $end && $list->[$child] < $list->[$child+1]);
                if($list->[$root] < $list->[$child])
                {
                        @$list[$root,$child] = @$list[$child,$root];
                        $root = $child;
                }else{ return }
        }
}

sub heapify
{
        my ($count,$list) = @_;
        my $start = ($count - 2) / 2;
        while($start >= 0)
        {
                sift_down($start,$count-1,$list);
                $start--;
        }
}

sub hSort {
	my($list) = @_;
        my $count = scalar @$list;
        heapify($count,$list);
 
        my $end = $count - 1;
        while($end > 0)
        {
                @$list[0,$end] = @$list[$end,0];
                sift_down(0,$end-1,$list);
                $end--;
        }

}

sub bSort {
	my ($list) = @_;
	my $jey = (scalar @$list) - 1;
	my $flag;
	my $temp;

	for (my $i = 0; $i <= scalar @$list; $i++) {
	    	$flag=0;
		for (my $j=0; $j < $jey; $j++) {
			if ($list->[$j] > $list->[$j+1]) {
	       			$temp=$list->[$j];
	       			$list->[$j]=$list->[$j+1];
	       			$list->[$j+1]=$temp;
	       			$flag=1;
	       		}
	       	}
	       	if ($flag!=1) {		
	       		next;
		}
	}
}

my @array = (24, 86, 34, 40, 57, 95, 53, 90, 6, 48);
@array = mSort(@array);
say Dumper(\@array);

@array = (24, 86, 34, 40, 57, 95, 53, 90, 6, 48);
hSort(\@array);
say Dumper(\@array);

@array = (24, 86, 34, 40, 57, 95, 53, 90, 6, 48);
bSort(\@array);
say Dumper(\@array);
