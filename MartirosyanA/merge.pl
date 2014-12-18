#!/usr/bin/perl
sub mergesort {

        my @a      = @_;

              

        return $_[0]  if @_ == 1;

        

        my $length = scalar @a;

        my $middle = int($length / 2);

        my @right=();

        my @left=();

        my @result;

        for ( my $i = 0 ; $i < $middle ; $i++ ) {

            push @left, $a[$i];

        }

        

        for ( my $i = $middle; $i < $length ; $i++ ) {

            push @right, $a[$i];

        }

        

        @left   = mergesort(@left);

        @right  = mergesort(@right);

        return  merge( \@left, \@right );

    }

    sub merge {

        my @left  = @{$_[0]};

        my @right = @{$_[1]};

        my @result;

        

        while(@left && @right) {

            my $t;

        

            if ( $left[0] <= $right[0] ) {

                $t = shift(@left);

            }

            else {

                $t= shift(@right);

            }

            

            push @result, $t;

        }

        

        if ( @left ) {

            push @result, @left;

        }

        

        if ( @right ) {

            push @result, @right;

        }

        

        return @result;

    }
my @ary = ();

for (my $i=1; $i<=$N; $i++) {

    $ary[$i] = gen-random(1.0);

}
print ("1, 2, 3, 1, 9, 8, 4, 3, 0, 20, 32, 12, 4, 12 ");
    print

      join( "\n", mergesort( 1, 2, 3, 1, 9, 8, 4, 3, 0, 20, 32, 12, 4, 12 ) );


