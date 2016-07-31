%% CodeWars - Katas in erlang
%% I feel comfortable adding these answers in Github as there is no support from 
%% codewars for Erlang code... yet. 
%% Sum by Factors Kata: https://www.codewars.com/kata/validate-sudoku-with-size-nxn

%% Note that a couple of helper functions were used with the assumption of only a NxN solution matrix. Theoretically, multidimensional checkers could be devised for each exponentiation of N using multidimensional rotations.

-module(sudoku_checker).
-export([
          validate/1
         ]).

validate(Board) ->
  try
      check_sudoku(Board)
  catch
      throw:not_valid -> not_valid
  end.

check_sudoku(Board) -> 
  NumberSet = sets:from_list(
      lists:seq(1, length(hd(Board)))
  ),
  check_rows(Board, NumberSet),
  check_rows(transpose(Board), NumberSet),
  check_small_boards(Board, NumberSet),
  ok.

check_rows([], _) -> ok;
check_rows([Row|T], Set) ->
  case number_diff(Row, Set) of
    true -> check_rows(T, Set);  
    _ -> throw(not_valid)
  end.

number_diff(Row, Set) ->
  Row_set = sets:from_list(Row),
  sets:is_subset(Row_set, Set)
    andalso sets:is_subset(Set, Row_set).

transpose([[]|_]) -> [];
transpose(Matrix) ->
  [lists:map(fun hd/1, Matrix) | transpose(lists:map(fun tl/1, Matrix))].

check_small_boards(Board, Set) ->
  SmallBoards = lists:flatten(split_by_rows(Board)),
  check_single_board(SmallBoards, trunc(math:sqrt(length(SmallBoards))), Set).

check_single_board([], _, _) -> ok;
check_single_board(Board, Size, Set) ->
  {First, Rest} = lists:split(Size, Board),
  case number_diff(First, Set) of
    true -> check_single_board(Rest, Size, Set);
    _ -> throw(not_valid)
  end.

split_sub_board(Board) ->
  lists:split(
    length(hd(Board)), 
    Board
  ).

split_board(Board) ->
  lists:split(
    trunc(math:sqrt(length(hd(Board)))), 
    Board
  ).

split_by_rows([]) -> [];
split_by_rows(Board) -> 
   {First, Rest} = split_board(Board),
   [split_by_cols(First)| split_by_rows(Rest)].

split_by_cols(Board) ->
  FlippedBoard = transpose(Board),

  {First, Rest} = split_sub_board(FlippedBoard),

  [First| split_by_cols(Rest, true)].
 
split_by_cols([], _) -> [];
split_by_cols(Board, _) -> 
  {First, Rest} = split_sub_board(Board),
  [First| split_by_cols(Rest, true)].

