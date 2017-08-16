defmodule Kata do
  @moduledoc """
  Solution to 2016's Advent of Code - Day 2
  http://adventofcode.com/2016/day/2

  Position system:

  | -1,+1   0,+1  +1,+1 |   | 1  2  3 |
  | -1, 0   0, 0  +1, 0 | = | 4  5  6 |
  | -1,-1   0,-1  +1,-1 |   | 7  8  9 |
  """
end

ExUnit.start

defmodule KataTest do
  use ExUnit.Case

  test "Convert position to digit" do
    assert Kata.position_to_digit([-1,  1]) == 1
    assert Kata.position_to_digit([ 0,  1]) == 2
    assert Kata.position_to_digit([ 1,  1]) == 3
    assert Kata.position_to_digit([-1,  0]) == 4
    assert Kata.position_to_digit([ 0,  0]) == 5
    assert Kata.position_to_digit([ 1,  0]) == 6
    assert Kata.position_to_digit([-1, -1]) == 7
    assert Kata.position_to_digit([ 0, -1]) == 8
    assert Kata.position_to_digit([ 1, -1]) == 9
  end

  test "Convert instruction char (U,D,L,R) to vector [x, y]" do
    # instruction_to_vector(instruction_char) -> vector
    assert Kata.instruction_to_vector("U") == [ 0,  1]
    assert Kata.instruction_to_vector("D") == [ 0, -1]
    assert Kata.instruction_to_vector("R") == [ 1,  0]
    assert Kata.instruction_to_vector("L") == [-1,  0]
  end

  test "Convert string of instructions to list of vectors [x, y]" do
    # instruction_string_to_vector_list(instruction_string) -> vector_list
    assert Kata.instruction_string_to_vector_list("UDRL") == [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  test "Apply vector to position" do
    # apply_vector_to_position(vector, position) -> position
    assert Kata.apply_vector_to_position([-1,  0], [ 0,  0]) == [-1,  0]
    assert Kata.apply_vector_to_position([ 1,  0], [-1, -1]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0, -1], [ 0,  0]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0,  1], [-1, -1]) == [-1,  0]
  end

  test "Gracefully reject invalid commands" do
    # apply_vector_to_position(vector, position) -> position
    assert Kata.apply_vector_to_position([-1,  0], [-1,  0]) == [-1,  0]
    assert Kata.apply_vector_to_position([ 1,  0], [ 1,  1]) == [ 1,  1]
    assert Kata.apply_vector_to_position([ 0, -1], [ 0, -1]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0,  1], [-1,  1]) == [-1,  1]
  end

  test "Process string of instructions and output a position" do
    # find_end_position(instruction_string, initial_position) -> position
    assert Kata.find_end_position("UUUUU", [0, 0]) == [0, 1]
    assert Kata.find_end_position("RDLL", [1, 0]) == [-1, -1]
  end

  test "Process the password recipe" do
    # process_recipe(instruction_string_list) -> digit_list
    assert Kata.process_recipe(["ULL", "RRDDD", "LURDL", "UUUUD"]) == [1, 9, 8, 5]
  end
end
