-module(quicksort).

-export([sort/1]).


divide_factory(F) ->
    fun (El, [S, B]) ->
            case El < F of
                true -> [S ++ [El], B];
                false -> [S, B ++ [El]]
            end
    end.

sort([]) -> [];
sort([A]) -> [A];
%% sort([F | List]) ->
%%     S = sort(lists:filter(fun (X) -> X < F end, List)),
%%     B = sort(lists:filter(fun (X) -> X >= F end, List)),
%%     S ++ [F] ++ B.

%% sort([F | List]) ->
%%     S = sort([X || X <- List, X < F]),
%%     B = sort([X || X <- List, X >= F]),
%%     S ++ [F] ++ B.

sort([F | List]) ->
    [S, B] = lists:foldl(divide_factory(F), [[], []], List),
    sort(S) ++ [F] ++ sort(B).
