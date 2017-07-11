#!/usr/bin/env perl6

sub EXPORT(|) {
    #Get the grammar.
    use Smart::Comments::Grammar;

    #Get the actions.
    use Smart::Comments::Actions;

    $*LANG.define_slang: 'MAIN',
        $*LANG.slang_grammar('MAIN').^mixin(Smart::Comments::Grammar),
        $*LANG.actions.^mixin(Smart::Comments::Actions);

    {}
}
