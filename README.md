[![Actions Status](https://github.com/lizmat/Unix-errno/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Unix-errno/actions) [![Actions Status](https://github.com/lizmat/Unix-errno/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Unix-errno/actions)

NAME
====

Unix::errno - Provide transparent access to errno

SYNOPSIS
========

```raku
use Unix::errno;  # exports errno, set_errno

set_errno(2);

say errno;              # No such file or directory (errno = 2)
say "failed: {errno}";  # failed: No such file or directory
say +errno;             # 2
```

DESCRIPTION
===========

This module provides access to the `errno` variable that is available on all Unix-like systems. Please note that in a threaded environment such as Raku is, the value of `errno` is even more volatile than it has been already. For now, this issue is ignored.

CAVEATS
=======

Since setting of any "extern" variables is not supported yet by `NativeCall`, the setting of `errno` is faked. If `set_errno` is called, it will set the value only in a shadow copy. That value will be returned as long as the underlying "real" errno doesn't change (at which point that value will be returned.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Unix-errno . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2021, 2024, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

