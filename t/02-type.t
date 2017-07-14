#!/usr/bin/env perl6

use v6;
use Test;
use lib 'lib';
use Smart::Comments;

plan 1;

my $g;

BEGIN { $g = $*LANG.^name; }

ok $g ~~ 'Perl6::Grammar+{Smart::Comments::Grammar}',
	"Grammar is of type: $g";

done-testing;
