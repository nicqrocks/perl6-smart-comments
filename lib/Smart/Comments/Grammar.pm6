#!/usr/bin/env perl6

#Define the grammar to expand.
role Smart::Comments::Grammar is export {
    #The basic structure of the grammar.
    token comment:sym<smc> {
        $<level>=('###'|'####'|'#####')
        {}
        <smc-msg>
        {note "In SMC: {$/.Str}"}
    }

    #Differentiate the message types.
    proto token smc-msg {*}
    token smc-msg:sym<basic> { <-[# \n]>+ }
}
