-module(average).

-export([average/1, sum/1, sum_folded/1, length2/1]).

%% sum([]) ->
%%     0;
%% sum([Hd | Tail]) ->
%%     Hd + sum(Tail).

sum(List) -> sum(List, 0).
sum([], Sum) -> Sum;
sum([Hd | Tail], Sum) ->
    sum(Tail, Sum + Hd).

sum_folded(_List) ->
    lists:foldl(fun (El, Acc) -> El + Acc end, 0, _List).

length2([]) ->
    0;
length2([_ | Tail]) ->
    1 + length2(Tail).

average(_List) ->
    sum(_List) / length(_List).
