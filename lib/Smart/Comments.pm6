#!/usr/bin/env perl6


sub EXPORT {
    #Get the grammar and actions.
    use Smart::Comments::Grammar;
    use Smart::Comments::Actions;

    $*LANG.define_slang: 'MAIN',
        $*LANG.slang_grammar('MAIN').^mixin(Smart::Comments::Grammar),
        $*LANG.actions.^mixin(Smart::Comments::Actions);

    {}
}
