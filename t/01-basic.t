use v6.c;
use Test;
use Unix::errno;

plan 3;

nok ::("Unix"),             'is UNIX NOT externally accessible?';
ok MY::<&errno>:exists,     'is errno imported?';
ok MY::<&set_errno>:exists, 'is set_errno imported?';

# vim: ft=perl6 expandtab sw=4
