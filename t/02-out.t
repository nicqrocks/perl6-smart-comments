#!/usr/bin/env perl6

use v6;
use Test;
use Test::Output;
use lib 'lib';

use Smart::Comments;

plan 6;

sub c1 {
    # Regular comment.
}
sub c2 {
    ## Regular comment.
}
sub c3 {
    ### Message...
}
sub c4 {
    #### Message...
}

#Make sure regular comments are not affected.
output-is { c1 }, "";
output-is { c2 }, "";

#Make sure that comments with 3+ '#' are outputed.
output-is { c3 }, "### Message...\n";
output-is { c4 }, "#### Message...\n";

#Make sure that it works ithout being in a sub.
output-is {
    ### No-sub
}, "### No-sub\n";
output-is {
    #Normal comment.
    ###Mixed comments.
    #Normal comment.
}, "###Mixed comments.\n";

done-testing;
