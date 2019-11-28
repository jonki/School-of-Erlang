-module(rev_polish_notation).

-export([evaluate/1, eval/1]).


call(El, [F, S | T]) ->
    [El(F, S)] ++ T.

calc(El, Acc) when is_function(El) -> call(El, Acc);
calc(El, Acc) -> [El] ++ Acc.

evaluate(List) ->
    [H] = lists:foldl(fun calc/2, [], List),
    H.

eval(Input) ->
    eval(Input, []).

eval([Input | Tl], Stack) when is_function(Input) ->
    [F, S | T] = Stack,
    eval(Tl, [Input(F, S)] ++ T);

eval([Input | Tl], Stack) ->
    eval(Tl, [Input] ++ Stack);

eval([], [Stack]) ->
    Stack.
