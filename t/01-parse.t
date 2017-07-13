#!/usr/bin/env perl6

use v6;
use Test;
use lib 'lib';
use Smart::Comments::Grammar;

#Make some vars.
my $msg = "Hello there friend";
my @list;

#Make a list of example lines to test.
for 1..10 -> $i {
    #Each item has a higher number of '#' than the last.
    @list.push: ("#" x $i ~ $msg);
}

plan +@list * 2;

#Define a grammar using the role.
grammar SMC does Smart::Comments::Grammar { }

#For each item in the list to test...
for @list -> $s {
    #Figure out how many '#' chars there are in this test.
    my $n = ($s ~~ / '#'* /).Str.chars;

    #Subtest for the 'statement_control' regex.
    subtest {
        #Parse the line using the 'statement_control' regex.
        my $m = SMC.parse: $s, :rule('statement_control:sym<smc>');
        #If the test has the correct amount of '#' chars, make sure it parses the
        #statement correctly.
        if ($n ~~ 3..5) {
            ok $m.<level> ~~ '#' x $n;
            ok $m.<smc-msg> ~~ $msg;
        } else {
            ok $m ~~ Nil|Any;
        }
    }

    #Subtest for the 'comment' regex.
    subtest {
        #Parse the line using the 'comment' regex.
        my $m = SMC.parse: $s, :rule('comment:sym<#>');
        #If the test has the correct amount of '#' chars, make sure it parses the
        #statement correctly.
        if ($n !~~ 3..5) {
            ok $m ~~ ('#' x $n ~ $msg);
        } else {
            ok $m ~~ Nil|Any;
        }
    }
}

done-testing;
