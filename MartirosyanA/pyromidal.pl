#!/usr/bin/perl 
my @array = (4,3,5,22,25,5,-48,0,4,-3);
heap_sort(\@array);
print "@array\n";
exit;
 


sub heap_sort
{
        my($list) = @_;
        my $count = scalar @$list;
        heap($count,$list);
 
        my $right = $count - 1;
        while($right > 0)
        {
                @$list[0,$right] = @$list[$right,0];
                sift(0,$right-1,$list);
                $right--;
        }
}
sub heap
{
        my ($count,$list) = @_;
        my $left = ($count - 2) / 2;
        while($left >= 0)
        {
                sift($left,$count-1,$list);
                $left--;
        }
}
sub sift
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
