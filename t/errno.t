use v6.c;
use Test;
use Unix::errno;

plan 3;

my $ = open("this-file-should-not-exist");  # sets errno to 2

is +$errno,     2,                                       'did we get the Int';
is $errno.Str,  'No such file or directory',             'did we get the Str';
is $errno.gist, 'No such file or directory (errno = 2)', 'did we get the gist';

# vim: ft=perl6 expandtab sw=4
