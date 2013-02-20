-module(functions).
-compile(export_all). % replace with -export() later, for sanity's sake

head([H|_]) -> H.
second([_,X|_]) -> X.

same(X,X) -> true;
same(_,_) -> false.
