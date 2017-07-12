#!/usr/bin/env perl6

use v6;
use Test;
use lib 'lib';
use Smart::Comments::Grammar;

my $msg = "Hello there friend";
my @list = (
    "### $msg...",
    "###$msg",
    "#### $msg        ",
    "### {$msg.subst("there", "\n")}"
);

plan +@list;

grammar SMC does Smart::Comments::Grammar { }

for @list -> $i {
    my $m = SMC.subparse: $i, :rule('statement_control:sym<smc>');
    ok $m !~~ Nil;
}

done-testing;
