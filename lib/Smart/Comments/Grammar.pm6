#!/usr/bin/env perl6

#Define the grammar to expand.
role Smart::Comments::Grammar is export {
    #Re-define token so that it does not grab the new thing.
    token comment:sym<#> {
        <!after '#'>
        ['#'|'##']:
        <-[# \n]>+
        {note "In new comment: {$/.Str}"}
    }

    #The basic structure of the grammar.
    token statement_control:sym<smc> {
        $<level>=("#"+)
        <smc-msg>
        {note "In SMC: {$/.Str}"}
    }

    #Differentiate the message types.
    proto token smc-msg {*}
    token smc-msg:sym<basic> { \N* {note "In MSG: {$/.Str}"} }
}
