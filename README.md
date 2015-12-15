eleb128
=======

LEB128 Erlang implementation — [https://en.wikipedia.org/wiki/LEB128]https://en.wikipedia.org/wiki/LEB128

Build
-----

    $ make

Tests
-----

    $ make test

Usage
-----

    $ make run
    1> application:load(eleb128).
    ok
    2> eleb128:signed_encode(-128).
    <<128,127>>
    3> eleb128:unsigned_encode(128).
    <<128,1>>
    4> eleb128:signed_decode(<<128,127>>).
    {-128,<<>>}
    5> eleb128:unsigned_decode(<<128,1>>).
    {128,<<>>}

