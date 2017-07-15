defmodule PokerDojo.Deck do
  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]


  defmodule Card do
    defstruct [:rank, :suit]
  end


  def new_deck do
    for rank <- @ranks, suit <- @suits do
      %Card{rank: rank, suit: suit}
    end
  end


  def evaluate(cards) when is_list(cards) do
    cards
    |> Enum.map(&to_tuple/1)
    |> Enum.sort
    |> eval
  end


  defp to_tuple(
    %Card{rank: rank, suit: suit}
  ), do: {rank, suit}


  def eval(
    [{10, s}, {11, s}, {12, s}, {13, s}, {14, s}]
  ), do: 10 # royal straight flush

  def eval(
    [{a, s}, {_, s}, {_, s}, {_, s}, {e, s}]
  ) when e - a == 4, do: 9 # straight flush
  def eval(
    [{2, s}, {3, s}, {4, s}, {5, s}, {14, s}]
  ), do: 9 # straight flush

  def eval(
    [{a, _}, {a, _}, {a, _}, {a, _}, {_, _}]
  ), do: 8 # four of a kind
  def eval(
    [{_, _}, {a, _}, {a, _}, {a, _}, {a, _}]
  ), do: 8 # four of a kind


  def eval(
    [{a, _}, {a, _}, {a, _}, {b, _}, {b, _}]
  ), do: 7 # full house
  def eval(
    [{a, _}, {a, _}, {b, _}, {b, _}, {b, _}]
  ), do: 7 # full house
end
