#!/usr/bin/env perl6

use nqp;
use QAST:from<NQP>;

#Define what to do about the grammar found.
role Smart::Comments::Actions is export {
    sub lk(Mu \h, \k) {
        nqp::atkey(nqp::findmethod(h, 'hash')(h), k)
    }

    method statement_control:sym<smc>($/) {
        note "Got: $/";
        my $msg := "Hello there";
        #my $msg := lk($/, 'smc-msg');
        note "The message is: $msg";
        my $b := QAST::Op.new:
            :op<call>,
            :name<note>,
            QAST::SVal.new(:value($msg));
        $/.make($b);
    }

    method smc-msg:sym<basic>($/) { make $/.Str; }
}
