#!/usr/bin/env perl6

use v6;
use Test;
use lib 'lib';
use QAST:from<NQP>;
use Smart::Comments::Grammar;
use Smart::Comments::Actions;

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
    my $m = SMC.subparse(
        $i,
        :rule('statement_control:sym<smc>'),
        :actions(Smart::Comments::Actions.new)
    ).made;

    ok $m.^name ~~ "QAST::Op";
}

done-testing;
