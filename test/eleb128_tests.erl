-module(eleb128_tests).

-include_lib("eunit/include/eunit.hrl").


signed_encode_test() ->
    ?assertEqual(<<127>>,                   eleb128:signed_encode(-1)),
    ?assertEqual(<<129,127>>,               eleb128:signed_encode(-127)),
    ?assertEqual(<<128,127>>,               eleb128:signed_encode(-128)),
    ?assertEqual(<<128,126>>,               eleb128:signed_encode(-256)),
    ?assertEqual(<<128,124>>,               eleb128:signed_encode(-512)),

    ?assertEqual(<<16#9B, 16#F1, 16#59>>,   eleb128:signed_encode(-624485)),
    ok.

unsigned_encode_test() ->
    ?assertEqual(<<1>>,                     eleb128:unsigned_encode(1)),
    ?assertEqual(<<127>>,                   eleb128:unsigned_encode(127)),
    ?assertEqual(<<128,1>>,                 eleb128:unsigned_encode(128)),
    ?assertEqual(<<128,2>>,                 eleb128:unsigned_encode(256)),
    ?assertEqual(<<128,4>>,                 eleb128:unsigned_encode(512)),

    ?assertEqual(<<16#E5, 16#8E, 16#26>>,   eleb128:unsigned_encode(624485)),
    ok.

signed_decode_test() ->
    ?assertEqual({-1,   <<>>},               eleb128:signed_decode(<<127>>)),
    ?assertEqual({-127, <<>>},               eleb128:signed_decode(<<129,127>>)),
    ?assertEqual({-128, <<>>},               eleb128:signed_decode(<<128,127>>)),
    ?assertEqual({-256, <<>>},               eleb128:signed_decode(<<128,126>>)),
    ?assertEqual({-512, <<>>},               eleb128:signed_decode(<<128,124>>)),

    ?assertEqual({-624485, <<>>},            eleb128:signed_decode(<<16#9B, 16#F1, 16#59>>)),
    ?assertEqual({-624485, <<16#1>>},        eleb128:signed_decode(<<16#9B, 16#F1, 16#59, 16#1>>)),
    ?assertEqual({-624485, <<16#A4>>},       eleb128:signed_decode(<<16#9B, 16#F1, 16#59, 16#A4>>)),
    ok.

unsigned_decode_test() ->
    ?assertEqual({1,   <<>>},               eleb128:unsigned_decode(<<1>>)),
    ?assertEqual({127, <<>>},               eleb128:unsigned_decode(<<127>>)),
    ?assertEqual({128, <<>>},               eleb128:unsigned_decode(<<128,1>>)),
    ?assertEqual({256, <<>>},               eleb128:unsigned_decode(<<128,2>>)),
    ?assertEqual({512, <<>>},               eleb128:unsigned_decode(<<128,4>>)),

    ?assertEqual({624485, <<>>},            eleb128:unsigned_decode(<<16#E5, 16#8E, 16#26>>)),
    ?assertEqual({624485, <<16#1>>},        eleb128:unsigned_decode(<<16#E5, 16#8E, 16#26, 16#1>>)),
    ?assertEqual({624485, <<16#A4>>},       eleb128:unsigned_decode(<<16#E5, 16#8E, 16#26, 16#A4>>)),
    ok.

