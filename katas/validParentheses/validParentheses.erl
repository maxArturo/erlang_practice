%% CodeWars - Katas in erlang
%% I feel comfortable adding these answers in Github as there is no support from 
%% codewars for Erlang code... yet. 
%% Sum by Factors Kata: https://www.codewars.com/kata/52774a314c2333f0a7000688

-module(validParentheses).
-include_lib("eunit/include/eunit.hrl").
-export([
         validParentheses/1
        ]).

validParentheses([]) -> ok;
validParentheses(String) -> 
  validParentheses(String, 0).

validParentheses(_, Num) when Num < 0 -> 
  false;

validParentheses([40 | Rest], Num) -> 
  validParentheses(Rest, Num + 1);

validParentheses([41 | Rest], Num) -> 
  validParentheses(Rest, Num - 1);

validParentheses([_ | Rest], Num) -> 
  validParentheses(Rest, Num);

validParentheses([], 0) -> 
  ok.

parentheses_test_() ->
  [
    ?_assert(validParentheses("()") =:= ok),
    ?_assert(validParentheses("(((((())))))") =:= ok),
    ?_assert(validParentheses("()()()()()()()()") =:= ok),
    ?_assert(validParentheses("((())))") =:= false),
    ?_assert(validParentheses("((()))stuff!)") =:= false),
    ?_assert(validParentheses("())") =:= false),
    ?_assert(validParentheses("(stuff!())") =:= ok)
  ].

