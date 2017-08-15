defmodule Challenge do
  @moduledoc """
  Template for solving test-driven challenges
  """

  def foo do
    "bar"
  end
end

ExUnit.start

defmodule ChallengeTest do
  use ExUnit.Case

  test "mytest" do
    assert Challenge.foo == "bar"
  end
end
