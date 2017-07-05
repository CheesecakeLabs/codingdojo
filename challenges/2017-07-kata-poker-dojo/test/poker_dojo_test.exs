defmodule PokerDojoTest do
  use ExUnit.Case
  alias PokerDojo.Deck
  alias PokerDojo.Deck.Card

  test "the truth" do
    assert Deck.test(%Card{rank: 1}) == 5
  end
end
