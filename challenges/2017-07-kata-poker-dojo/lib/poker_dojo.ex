defmodule PokerDojo do

  def hello(a), do: hello(a, 3)
  def hello(_, 3), do: "peixe"
  def hello(_peixe, 4), do: "nao acontece"
  def hello(_, _), do: "qualquer coisa"
end
