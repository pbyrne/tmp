-module(useless).

-export([add/2, hello/0, greet_and_add_two/1]).

add(A,B) ->
  A + B.

%% shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
  io:format("Hello, world!~n").

%% greets the user and adds 2 to the given value
greet_and_add_two(X) ->
  hello(),
  add(X,2).
