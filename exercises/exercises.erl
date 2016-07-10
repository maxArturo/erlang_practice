% These are answers to the set of exercises found in the official Erlang website:
% http://erlang.org/course/exercises.html

-module(exercises).
-export([
         f2c/1,
         c2f/1,
         convert/1,
         min/1,
         max/1,
         min_max/1,
         swedish_date/0
        ]).
%%
%% Simple sequential programs
%%
% Write functions temp:f2c(F) and temp:c2f(C) which convert between centigrade and Fahrenheit scales. (hint 5(F-32) = 9C)
f2c(Fahr) ->
  5 * (Fahr - 32) / 9.

c2f(Celsius) ->
  (Celsius * 9 / 5) + 32.

% 2. Write a function temp:convert(Temperature) which combines the functionality of f2c and c2f. Example:
% 
%     > temp:convert({c,100}).
%     => {f,212}
%     > temp:convert({f,32}).
%     => {c,0}
% 

convert({c, Celsius}) -> 
  {f, (Celsius * 9 / 5) + 32};
convert({f, Fahr}) -> 
  {c, 5 * (Fahr - 32) / 9}.

%%
%% Simple recursive programs
%%
% 1. Write a function lists1:min(L) which returns the mini- mum element of the list L.

min([]) -> 
  0;
min([H|T]) -> 
  min_helper(T, H).
    
min_helper([H|T], Min) ->
  case H < Min of
      true -> min_helper(T, H);
      false -> min_helper(T, Min)
  end;

min_helper([], Min) ->
  Min.


% 2. Write a function lists1:max(L) which returns the maximum element of the list L.
max([]) -> 
  0;
max([H|T]) -> 
  max_helper(T, H).
    
max_helper([H|T], Max) ->
  case H > Max of
      true -> max_helper(T, H);
      false -> max_helper(T, Max)
  end;

max_helper([], Max) ->
  Max.
 
% 3. Write a function lists1:min_max(L) which returns a tuple containing the min and max of the list L.
%

min_max([]) -> 
  {0, 0};
min_max([H|T]) -> 
  min_max_helper(T, H, H).
    
min_max_helper([H|T], Min, Max) ->
  if
      H > Max ->
        min_max_helper(T, Min, H);
      H < Min ->
        min_max_helper(T, H, Max);
      true -> 
        min_max_helper(T, Min, Max)
  end;

min_max_helper([], Min, Max) ->
  {Min, Max}.

% 4. Write the function time:swedish_date() which returns a string containing the date in swedish YYMMDD format.
%

swedish_date() ->
  Format = fun(Num) -> string:right(integer_to_list(Num), 2, $0) end,
  
  Measures = lists:flatmap(Format, tuple_to_list(date())),

