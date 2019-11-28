-module(quicksort).

-export([sort/1]).

sort([]) -> [];
sort([A]) -> [A];
%% sort([F | List]) ->
%%     S = sort(lists:filter(fun (X) -> X < F end, List)),
%%     B = sort(lists:filter(fun (X) -> X >= F end, List)),
%%     S ++ [F] ++ B.

sort([F | List]) ->
    S = sort([X || X <- List, X < F]),
    B = sort([X || X <- List, X >= F]),
    S ++ [F] ++ B.
