-module(accumulator).
-export([odd_and_even/1]).

odd_and_even(List) -> 
  accumulator(List, [], []).

accumulator([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> accumulator(T, [H|Odds], Evens);
    0 -> accumulator(T, Odds, [H|Evens])
  end;

accumulator([], Odds, Evens)    ->
  { Odds, Evens }.

