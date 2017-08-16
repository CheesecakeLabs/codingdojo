defmodule Kata do
  @moduledoc """
  Solution to 2016's Advent of Code - Day 2
  http://adventofcode.com/2016/day/2

  Position system:

  | -1,+1   0,+1  +1,+1 |   | 1  2  3 |
  | -1, 0   0, 0  +1, 0 | = | 4  5  6 |
  | -1,-1   0,-1  +1,-1 |   | 7  8  9 |

  U = [ 0,  1]
  D = [ 0, -1]
  R = [ 1,  0]
  L = [-1,  0]
  """
  def position_to_digit(pos) do
    case pos do
      [-1,  1] -> 1
      [ 0,  1] -> 2
      [ 1,  1] -> 3
      [-1,  0] -> 4
      [ 0,  0] -> 5
      [ 1,  0] -> 6
      [-1, -1] -> 7
      [ 0, -1] -> 8
      [ 1, -1] -> 9
    end
  end

  def instruction_to_vector("U"), do: [ 0,  1]
  def instruction_to_vector("D"), do: [ 0, -1]
  def instruction_to_vector("R"), do: [ 1,  0]
  def instruction_to_vector("L"), do: [-1,  0]

  def instruction_string_to_vector_list(instruction_string) do
    instruction_string
    |> String.codepoints()
    |> Enum.map(&instruction_to_vector(&1))
    # |> Enum.map(fn character -> instruction_to_vector(character) end)
  end

  def apply_vector_to_position([x_vector, y_vector], [x_pos, y_pos] = pos) do
    new_pos = [x_vector + x_pos, y_vector + y_pos]
    case new_pos do
      [x, y] when ((abs x) > 1) or ((abs y) > 1) -> pos
      _ -> new_pos
    end
  end

  def find_end_position(instruction_string, initial_pos \\ [0, 0]) do
    instruction_string
    |> instruction_string_to_vector_list()
    |> Enum.reduce(initial_pos, &apply_vector_to_position/2)
  end

  def process_recipe(instruction_string_list, position_list \\ [], initial_position \\ [0, 0])
  def process_recipe([], position_list, _), do: Enum.map(position_list, &position_to_digit/1)
  def process_recipe([current_instruction_string | next_instructions], position_list, current_position) do
    new_position = find_end_position(current_instruction_string, current_position)
    new_position_list = Enum.concat(position_list, [new_position])
    process_recipe(next_instructions, new_position_list, new_position)
  end
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

  test "Convert an instruction char to a vector [x, y]" do
    assert Kata.instruction_to_vector("U") == [ 0,  1]
    assert Kata.instruction_to_vector("D") == [ 0, -1]
    assert Kata.instruction_to_vector("R") == [ 1,  0]
    assert Kata.instruction_to_vector("L") == [-1,  0]
  end

  test "Convert string of instructions (e.g.: UDRL) to list of vectors [x, y]" do
    assert Kata.instruction_string_to_vector_list("UDRL") == [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  test "Apply vector to a position" do
    assert Kata.apply_vector_to_position([-1,  0], [ 0,  0]) == [-1,  0]
    assert Kata.apply_vector_to_position([ 1,  0], [-1, -1]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0, -1], [ 0,  0]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0,  1], [-1, -1]) == [-1,  0]
  end

  test "Gracefully reject invalid commands" do
    assert Kata.apply_vector_to_position([-1,  0], [-1,  0]) == [-1,  0]
    assert Kata.apply_vector_to_position([ 1,  0], [-1, -1]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0, -1], [ 0,  0]) == [ 0, -1]
    assert Kata.apply_vector_to_position([ 0,  1], [-1, -1]) == [-1,  0]
  end

  test "Process string of instructions and output a position" do
    assert Kata.find_end_position("UUUUUUU", [0, 0]) == [0, 1]
    assert Kata.find_end_position("UDR", [0, 0]) == [1, 0]
  end

  test "Process the password recipe" do
    assert Kata.process_recipe(["ULL", "RRDDD", "LURDL", "UUUUD"]) == [1, 9, 8, 5]
    assert Kata.process_recipe(["UUDLRL", "UDR", "RUDL", "LLLL"]) == [4, 5, 5, 4]
  end
end
