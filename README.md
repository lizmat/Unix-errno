[![Build Status](https://travis-ci.org/lizmat/Unix-errno.svg?branch=master)](https://travis-ci.org/lizmat/Unix-errno)

NAME
====

Unix::errno - Provide transparent access to errno

SYNOPSIS
========

    use Unix::errno;  # exports $errno

    open("file-that-does-not-exist");
    say $errno;            # No such file or directory (errno = 2)
    say "failed: $errno";  # failed: No such file or directory
    say +$errno;           # 2

DESCRIPTION
===========

This module provides access to the `errno` variable that is available on all Unix-like systems. Please note that in a threaded environment such as Perl 6 is, the value of `errno` is even more volatile than it has been already. For now, this issue is ignored.

CAVEATS
=======

The first time after this module has been installed or each time a new version of Rakudo has been installed, the first time `$errno` is stringified something happens that sets `$errno` to 60. This seems related to precompilation and/or lazy loading of the parts of the module.

Until now, no way has been found to avoid this, other than it would cause a significant overhead.

Since setting of any "extern" variables is not supported yet by `NativeCall`, this module does not allow any direct access either. This may change in the future, either by writing a specific errno setter in C, or by having `NativeCall` do the right thing in the `cglobal` function.

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/Unix-errno . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

