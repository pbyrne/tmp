-module(guards).
-export([old_enough/1]).

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.
