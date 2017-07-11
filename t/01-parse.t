#!/usr/bin/env perl6

use v6;
use Test;
use lib 'lib';
use Smart::Comments::Grammar;
plan 1;

grammar SMC does Smart::Comments::Grammar { }

my $m = SMC.parse: "###Hello there", :rule('statement_control:sym<smc>');
note $m;

ok $m !~~ Nil;

done-testing;
