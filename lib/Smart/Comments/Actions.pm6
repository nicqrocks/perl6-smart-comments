#!/usr/bin/env perl6

use nqp;
use QAST:from<NQP>;

#Define what to do about the grammar found.
role Smart::Comments::Actions is export {
    sub lk(Mu \h, \k) {
        nqp::atkey(nqp::findmethod(h, 'hash')(h), k)
    }

    method comment:sym<smc>(Mu $/) {
        #Get the message.
        my $msg := lk($/, 'smc-msg');

        #Make the QAST::Op.
        my $b := QAST::Op.new:
            :op<call>,
            :name<say>,
            QAST::SVal.new(:value($msg.Str));

        #Add the block to the `made` var.
        $/.make($b);
    }
}
