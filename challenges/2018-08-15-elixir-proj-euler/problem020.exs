defmodule Challenge do
  @moduledoc """
  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!
  """

  def factorial(number) do
    1..number
    |> Enum.reduce(&(&1 * &2))
  end

  def sum_digits(number) do
    Integer.digits(number)
    |> Enum.sum()
  end

  def factorial_sum(number) do
    factorial(number)
    |> sum_digits()
  end

end

ExUnit.start

defmodule ChallengeTest do
  use ExUnit.Case

  test "factorial" do
    assert Challenge.factorial(10) == 3628800
  end

  test "sum digits of an int" do
    assert Challenge.sum_digits(3628800) == 27
  end

  test "sum of the factorial of 100" do
    assert Challenge.factorial_sum(100) == 648
  end
end