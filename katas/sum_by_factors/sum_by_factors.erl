%% CodeWars - Katas in erlang
%% I feel comfortable adding these answers in Github as there is no support from 
%% codewars for Erlang code... yet. 
%% Sum by Factors Kata: https://www.codewars.com/kata/sum-by-factors

-module(katas).
-export([
         sieve/1,
         sum_by_factors/1
        ]).


sum_by_factors(List) -> 
  Divisors = [El || El <- sieve(lists:max(List)), is_divisor(El, List) =:= true],
  [{El, sum_one_factor(El, List)} || El <- Divisors].

  
sum_one_factor(El, List) -> 
  lists:foldl(
    fun(Num, Sum) -> 
        if 
          (Num rem El) =:= 0 -> 
            Num + Sum;
          true ->
            Sum
        end
    end,
    0,
    List
   ).

is_divisor(_, []) -> 
  false;
is_divisor(Prime, [H|T]) -> 
  if
    (H rem Prime) =:= 0 ->
      true;
    true -> 
      is_divisor(Prime, T)
  end.



sieve(2) -> [2];
sieve(3) -> [2, 3];
sieve(Num) when is_integer(Num), (Num > 1) ->
  sieve([], [2 | lists:seq(3, Num, 2)]).

sieve(Primes, [H|List]) -> 
  sieve([H|Primes], [El || El <- List, (El rem H) =/= 0]);

sieve(Primes, []) -> lists:reverse(Primes).

