defmodule PokerDojoTest do
  use ExUnit.Case
  alias PokerDojo.Deck
  alias PokerDojo.Deck.Card

  test "that plays work" do
    assert Deck.eval([{10, :clubs}, {11, :clubs}, {12, :clubs}, {13, :clubs}, {14, :clubs}]) == 10
  end
end
