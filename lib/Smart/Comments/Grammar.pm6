#!/usr/bin/env perl6

#Define the grammar to expand.
role Smart::Comments::Grammar is export {
    #The basic structure of the grammar.
    rule statement_control:sym<smc> {:!s ('#' ** 3..*) " "? <msg> <?before \n+> }

    #Differentiate the message types.
    proto token msg {*}
    token msg:sym<basic> { .* }
}
