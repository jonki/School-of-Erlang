-module(intro_ex1).

-export([hello_name/1, hello_name/2]).

hello_name(Name) ->
    io:fwrite("Hello ~p!\n", [Name]).

hello_name(Name, Surname) ->
    io:fwrite("Hello ~p ~p!\n", [Name, Surname]).
