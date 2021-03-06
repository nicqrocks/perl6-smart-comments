#!/usr/bin/env perl6

use nqp;
use QAST:from<NQP>;

#Define what to do about the grammar found.
role Smart::Comments::Actions is export {
    sub lk(Mu \h, \k) {
        nqp::atkey(nqp::findmethod(h, 'hash')(h), k)
    }

    method statement_control:sym<smc>(Mu $/) {
        #Get the message.
        my $lvl := lk($/, 'level');
        my $msg := lk($/, 'smc-msg');
        #Make the QAST::Op.
        my $b := QAST::Op.new:
            :op<call>,
            :name<&note>,
            QAST::SVal.new(:value($lvl.Str ~ $msg.Str));

        #Add the block to the `made` var.
        # try {
        #     my $BLOCK := $*CURPAD;
        #     $BLOCK.push: $b;
        #     $BLOCK.node: $/;
        #     CATCH { default { .Str.say; } }
        # }
        $/.'make'($b);
    }

}
