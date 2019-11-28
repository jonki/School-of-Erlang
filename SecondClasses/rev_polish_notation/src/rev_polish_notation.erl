-module(rev_polish_notation).

-export([evaluate/1]).


%% evaluate(_) ->
%%     1.


push(List, Elem) ->
    [Elem | List].

pop([Elem | Tail]) ->
    {Elem, Tail}.

call([F, S | _], Fn) ->
     Fn(F, S).

calc(El, Acc) ->
    case is_function(El) of
        true -> call(Acc, El);
        false -> Acc ++ [El]
    end.

evaluate(List) ->
    lists:foldl(fun calc/2, [], List).

%% evaluate([3,4, fun erlang:'+'/2]).
