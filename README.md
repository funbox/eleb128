# eleb128

[![Build Status](https://travis-ci.org/funbox/eleb128.svg?branch=master)](https://travis-ci.org/funbox/eleb128)

[LEB128](https://en.wikipedia.org/wiki/LEB128) Erlang implementation. 

## Build

```bash
make
```

## Tests

```bash
make test
```

## Usage

```text
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
```

[![Sponsored by FunBox](https://funbox.ru/badges/sponsored_by_funbox_centered.svg)](https://funbox.ru)
