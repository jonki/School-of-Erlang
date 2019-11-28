-module(rev_polish_notation).

-export([evaluate/1, eval/1]).


calc(El, [F | T]) when is_function(El, 1) -> [El(F)] ++ T;
calc(El, [F, S | T]) when is_function(El, 2) -> [El(F, S)] ++ T;
calc(El, Acc) -> [El] ++ Acc.

evaluate(List) ->
    [H] = lists:foldl(fun calc/2, [], List),
    H.

eval(Input) ->
    eval(Input, []).

eval([Input | Tl], [F | T]) when is_function(Input, 1) ->
    eval(Tl, [Input(F)] ++ T);

eval([Input | Tl], [F, S | T]) when is_function(Input, 2) ->
    eval(Tl, [Input(F, S)] ++ T);

eval([Input | Tl], Stack) ->
    eval(Tl, [Input] ++ Stack);

eval([], [Stack]) ->
    Stack.
