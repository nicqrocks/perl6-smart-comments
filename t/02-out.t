#!/usr/bin/env perl6

use v6;
use Test;
use Test::Output;
use lib 'lib';

use Smart::Comments;

#This is not a test.
####This is a test.

plan 6;

sub c1 {
    # Regular comment.
    1+1;
}
sub c2 {
    ## Regular comment.
    1+1;
}
sub c3 {
    ### Message...
    1+1;
}
sub c4 {
    #### Message...
    1+1;
}

#Make sure regular comments are not affected.
output-is { c1 }, "", "Regular comment x1";
output-is { c2 }, "", "Regular comment x2";

#Make sure that comments with 3+ '#' are outputed.
output-is { c3 }, "### Message...\n", "Smart comment x3";
output-is { c4 }, "#### Message...\n", "Smart comment x4";

#Make sure that it works without being in a sub.
output-is {
        ### No-sub
        1+1;
    },
    "### No-sub\n",
    "Comment outside of sub";
output-is {
        #Normal comment.
        ###Mixed comments.
        #Normal comment.
        1+1;
    },
    "###Mixed comments.\n",
    "Regular comments mixed with smart comments";

done-testing;
