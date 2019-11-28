-module(fibonacci_sum).

-export([fibonacci_sum/0, fibonacci_sum/4]).

fibonacci_sum() ->
    Limit = 4 * 1000 * 1000,
    fibonacci_sum(1, 1, 0, Limit).

even(X) when X >= 0 -> (X band 1) == 0.

sum_even(El, Sum) ->
    case even(El) of
        true -> El + Sum;
        false -> Sum
    end.

fibonacci_sum(_Prev, _Curr, _Sum, _Limit) ->
    case _Curr > _Limit of
        true -> _Sum;
        false ->
            Sum = sum_even(_Curr, _Sum),
            Curr = _Prev + _Curr,
            fibonacci_sum(_Curr, Curr, Sum, _Limit)
    end.
