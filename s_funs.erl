-module(s_funs).
-export([s_map/2]).
-export([s_sum/1]).
-export([s_for/3]).
-export([test/1, test/2]).

s_map(Projection, [H|T]) -> 
  [Projection(H) | s_map(Projection, T)];

s_map(_, []) -> [].


s_sum([H|T]) -> H + s_sum(T);
s_sum([]) -> 0.


s_for(Max, Max, F) -> [F(Max)];
s_for(I, Max, F) -> [F(I) | s_for(I + 1, Max, F)].

test(Input) -> Input + 5.
test(Input, Stuff) -> Input + Stuff + 5.

