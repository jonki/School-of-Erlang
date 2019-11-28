-module(multiples).

-export([thousand_sum/0]).

thousand() ->
    lists:seq(1, 1000).

calc(El, Acc) ->
    case [El rem 3, El rem 5] of
        [0, 0] ->
            Acc + El;
        [0, _] ->
            Acc + El;
        [_, 0] ->
            Acc + El;
        _Else ->
            Acc
    end.

thousand_sum() ->
    lists:foldl(fun calc/2, 0, thousand()).
