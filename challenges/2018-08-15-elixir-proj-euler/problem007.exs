defmodule Challenge do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  What is the 10 001st prime number?
  """

  def is_prime?(1), do: false
  def is_prime?(2), do: true
  def is_prime?(3), do: true
  def is_prime?(number) do
    2..trunc(:math.sqrt(number))
    |> Enum.all?(&(rem(number, &1) != 0))
  end

#  def nth_prime(target) do
#    Stream.iterate(2, &(&1+1))
#    |> Stream.filter(&is_prime?/1)
#    |> Stream.take(target)
#    |> Enum.take(-1)
#    |> List.first()
#  end

  def nth_prime(target), do: nth_prime(target, 2, 0)
  def nth_prime(target, acc, counter) do
    if counter < target do
      if is_prime?(acc) do
        nth_prime(target, acc+1, counter+1)
      else
        nth_prime(target, acc+1, counter)
      end
    else
      acc-1
    end
  end
end

ExUnit.start

defmodule ChallengeTest do
  use ExUnit.Case

  test "is prime number?" do
    assert Challenge.is_prime?(13) == true
    assert Challenge.is_prime?(12) == false
  end

  test "6th prime number" do
    assert Challenge.nth_prime(6) == 13
  end

  test "nth prime number" do
    assert Challenge.nth_prime(10_001) == 104743
  end
end