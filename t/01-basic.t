use v6.c;
use Test;
use Unix::errno;

plan 2;

ok defined(::('$errno')),          'is $errno imported?';
ok defined(Unix::errno::<$errno>), 'is $errno externally accessible?';

# vim: ft=perl6 expandtab sw=4
