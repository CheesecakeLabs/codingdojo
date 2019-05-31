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

  def calculate(width, height, bombs) do
    for x <- 0..width-1,
        y <- 0..height-1 do

      case Enum.member?(bombs, {x,y}) do
        true  -> {{x,y}, '*'}
        false -> {{x,y}, [
          {x-1, y-1}, {x, y-1}, {x+1, y-1},
          {x-1, y},             {x+1, y},
          {x-1, y+1}, {x, y+1}, {x+1, y+1},
        ]
        |> Enum.filter(fn spot -> Enum.member?(bombs, spot) end)
        |> Enum.count()
                 }
      end

    end
    |> Map.new()
  end

end

ExUnit.start

defmodule ChallengeTest do
  use ExUnit.Case

  test "end_to_end" do
    assert Challenge.calculate(4, 4, [{0,0}, {1,2}]) == %{
             {0, 0} => '*',
             {0, 1} => 2,
             {0, 2} => 1,
             {0, 3} => 1,
             {1, 0} => 1,
             {1, 1} => 2,
             {1, 2} => '*',
             {1, 3} => 1,
             {2, 0} => 0,
             {2, 1} => 1,
             {2, 2} => 1,
             {2, 3} => 1,
             {3, 0} => 0,
             {3, 1} => 0,
             {3, 2} => 0,
             {3, 3} => 0,
           }
  end

end
