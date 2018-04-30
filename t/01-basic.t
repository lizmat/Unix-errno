use v6.c;
use Test;
use Unix::errno;

plan 2;

ok MY::<$errno>:exists,          'is $errno imported?';
ok Unix::errno::<$errno>:exists, 'is $errno externally accessible?';

# vim: ft=perl6 expandtab sw=4
