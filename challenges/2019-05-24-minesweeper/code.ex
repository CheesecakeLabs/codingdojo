defmodule Challenge do
  @moduledoc """
  Você já jogou Campo Minado? É um pequeno jogo que vem instalado em um certo Sistema Operacional cujo nome não
  conseguimos lembrar. O objetivo deste jogo é encontrar onde estão todas as minas em um campo de tamanho MxN (M e N
  inteiros). Para te ajudar, para cada posição, o jogo exibe o número de minas que são adjacentes a ela.

  Por exemplo, suponha o seguinte campo 4x4 com 2 minas (representadas pelo caractere *):

  * . . .
  . . . .
  . * . .
  . . . .
  Representando o mesmo campo, colocando os números de dicas como descrito acima, teremos:

  * 1 0 0
  2 2 1 0
  1 * 1 0
  1 1 1 0
  Como você pode perceber, cada quadrado pode ter até 8 quadrados adjacentes.

  Sua tarefa é, dado a definição de um campo (definido por suas dimensões e pelo posicionamento das minas), retornar o
  mesmo campo com as indicações de números de minas adjacentes em cada posição que não contenha uma mina.
  """

  def replace('.'), do: 0
  def replace(x) when is_nil(x), do: "IS NIL MOTHER LOVER"
  def replace(x), do: x

  def replace_dots(row), do: Enum.map(row, &replace/1)

  def add_border(camp) do
    height = Enum.count(camp)
    width = Enum.count(List.first(camp))

    first_and_last = [0]
      |> Stream.cycle
      |> Enum.take(width)

    [first_and_last] ++ camp ++ [first_and_last]
    |> Enum.map(fn x -> [0] ++ replace_dots(x) ++ [0] end)
  end

  def pulo_do_gato(num, width, height) do
    max_num = width*height

    [
      num-1, num, num+1,
      num-1+width, num+width, num+1+width,
      num-1-width, num-width, num+1-width,
    ]
    |> Enum.filter( fn x -> x > 0 or x < max_num end )
  end

  def get_camp_value(flat_camp, x) do
    Enum.at(flat_camp, x)
  end

  def test(camp, width, height) do
    camp_f =
      camp
      |> add_border()
      |> List.flatten()

    0
    |> Stream.iterate(fn x -> x + 1 end)
    |> Enum.take(width*height)
    |> Enum.map(fn x -> pulo_do_gato(x, width, height) end)
    |> IO.inspect()
#    |> Enum.map(fn x -> Enum.map(Enum.at(camp_f, x)) end)
  end

  def calculate(camp) do
    height = Enum.count(camp)
    width = Enum.count(List.first(camp))

    test(camp, width, height)

#    [['*', 1, 0, 0], [2, 2, 1, 0], [1, '*', 1, 0], [1, 1, 1, 0]]
  end
end

ExUnit.start

defmodule ChallengeTest do
  use ExUnit.Case

  test "end_to_end" do
    assert Challenge.calculate(
             [['*', '.', '.', '.'], ['.', '.', '.', '.'], ['.', '*', '.', '.'], ['.', '.', '.', '.']]
           ) == [['*', 1, 0, 0], [2, 2, 1, 0], [1, '*', 1, 0], [1, 1, 1, 0]]
  end

#  a + b == Kernel.+(a, b)

  test "add_border" do
    assert Challenge.add_border(
             [['*', '.', '.', '.'], ['.', '.', '.', '.'], ['.', '*', '.', '.'], ['.', '.', '.', '.']]
           ) == [[0, 0, 0, 0, 0, 0],
                 [0, '*', 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0],
                 [0, 0, '*', 0, 0, 0],
                 [0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0]]
  end
end
