#!/usr/bin/env perl6

use nqp;
use NQPHLL:from<NQP>;

sub EXPORT(|) {
    #Get the grammar.
    use Smart::Comments::Grammar;

    #Get the actions.
    use Smart::Comments::Actions;

    $*LANG.define_slang: 'MAIN',
        Smart::Comments::Grammar,
        Smart::Comments::Actions;

    {}
}
