-module(exercises).
-export([
         f2c/1,
         c2f/1,
         convert/1  
        ]).

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

