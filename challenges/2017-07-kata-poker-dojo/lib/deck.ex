defmodule PokerDojo.Deck do
  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]

  defmodule Card do
    defstruct [:rank, :suit]
  end

  def new do
    for rank <- @ranks, suit <- @suits do
      %Card{rank: rank, suit: suit}
    end
  end

  def test(%Card{rank: 1}), do: 5
end
