#!/usr/bin/env perl6

#Define the grammar to expand.
role Smart::Comments::Grammar is export {
    #The basic structure of the grammar.
    rule comment:sym<smc> {:!s ["#" ** 3..5] " "? <smc-msg> }

    #Differentiate the message types.
    proto token smc-msg {*}
    token smc-msg:sym<basic> { \N* }
}
