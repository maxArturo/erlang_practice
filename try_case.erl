-module(try_case).
-export([test/1]).

test(Test_no) -> 
  case Test_no of
      X when X > 10 ->
          "greater than 10";
      X when X < 0  ->
          "less than 0";
      _ -> 
          "between 0 and 10"
  end.

