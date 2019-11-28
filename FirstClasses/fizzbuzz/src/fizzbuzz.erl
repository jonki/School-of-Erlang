-module(fizzbuzz).

-export([fizzbuzz/0]).

replace(El) ->
    case [El rem 3, El rem 5] of
        [0, 0] ->
            fizzbuzz;
        [0, _] ->
            fizz;
        [_, 0] ->
            buzz;
        _Else ->
            El
    end.

remainders(El) ->
    [El rem 3, El rem 5].

replace2(El) ->
    El.

fizzbuzz() ->
    lists:map(fun replace/1, lists:seq(1, 100)).
