defmodule FizzBuzz do
  @moduledoc """
  Neste problema, você deverá exibir uma lista de 1 a 100, um em cada linha, com as seguintes exceções:

  Números divisíveis por 3 deve aparecer como 'Fizz' ao invés do número;
  Números divisíveis por 5 devem aparecer como 'Buzz' ao invés do número;
  Números divisíveis por 3 e 5 devem aparecer como 'FizzBuzz' ao invés do número'.
  """

  def fizz_buzz(i) when rem(i, 3) == 0 and rem(i, 5) == 0, do: "FizzBuzz"
  def fizz_buzz(i) when rem(i, 3) == 0, do: "Fizz"
  def fizz_buzz(i) when rem(i, 5) == 0, do: "Buzz"
  def fizz_buzz(i), do: Integer.to_string(i)

  def solve() do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(&fizz_buzz/1)
    |> Stream.take(100)
    |> Enum.each(&IO.puts/1)
  end
end

FizzBuzz.solve()
