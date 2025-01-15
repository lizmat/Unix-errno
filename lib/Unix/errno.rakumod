use NativeCall;

my constant @message = do {

    sub strerror(int32 $a --> str) is native {*}  # UNCOVERABLE

    my @errors = "";
    my int $i;
    until (my $message = strerror(++$i)).starts-with("Unknown error") {  # UNCOVERABLE
        @errors.push: $message;  # UNCOVERABLE
    }

    @errors.List  # UNCOVERABLE
}

my constant CLIB = $*KERNEL.name eq 'darwin'
  ?? 'libSystem.B.dylib'
  !! 'libc.so.6';   # other variations may need to be added later
my int $last_set = 0;
my int $last_seen_native
  = my $ERRNO := cglobal(CLIB, "errno", int32);

my class errno {
    method !index() {
        my int $errno_now = $ERRNO;
        $last_set = $last_seen_native = $errno_now
          if $last_seen_native != $errno_now;
        $last_set
    }
    method Str(--> Str:D)  { @message[self!index] }
    method gist(--> Str:D) {
        if self!index -> $index {
            "@message[$index] (errno = $index)"
        }
        else {
            ""
        }
    }
    method Numeric(--> Int:D) { self!index }
}

my $proxy := Proxy.new(
  FETCH => -> $ { UNIT::errno },
  STORE => -> $, $value { set_errno($value) }
);

my sub errno() is export is raw { $proxy }
my sub set_errno(Int() $value) is export is raw {
    # ignore any changes until now
    $last_seen_native = $ERRNO;  # UNCOVERABLE

    $last_set = $value;
    $proxy
}

# vim: expandtab shiftwidth=4
