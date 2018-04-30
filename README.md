NAME
====

Unix::errno - Provide transparent access to errno

SYNOPSIS
========

    use Unix::errno;  # exports $errno

    open("file-that-does-not-exist);
    say $errno;            # No such file or directory (errno = 2)
    say "failed: $errno";  # failed: No such file or directory
    say +$errno;           # 2

DESCRIPTION
===========

This module provides access to the `errno` variable that is available on all Unix-like systems.

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/Unix-errno . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

