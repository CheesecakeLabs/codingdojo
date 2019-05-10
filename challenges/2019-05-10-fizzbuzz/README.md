# Challenge

## FizzBuzz

http://dojopuzzles.com/problemas/exibe/fizzbuzz/

> Este problema foi utilizado em 554 Dojo(s).
>
> FizzBuzz
>
> Neste problema, você deverá exibir uma lista de 1 a 100, um em cada linha, com as seguintes exceções:
>
> Números divisíveis por 3 deve aparecer como 'Fizz' ao invés do número;
> Números divisíveis por 5 devem aparecer como 'Buzz' ao invés do número;
> Números divisíveis por 3 e 5 devem aparecer como 'FizzBuzz' ao invés do número'.

# Solution

Language of choice: Elixir

## Running the code

`elixir code.ex`

## Explanation:

We define a function `fizz_buzz/1` that receives an `Integer` argument and returns either `"Fizz"`, `"Buzz"`,
`"FizzBuzz"` or the string representation of the number, depending on which of the cases the number falls into.

We implement this by having a function defined multiple times with [guards clauses](https://hexdocs.pm/elixir/master/guards.html)
to define which one will be used. The first matching patter will be used, so we define the most specific first:

```elixir
  def fizz_buzz(i) when rem(i, 3) == 0 and rem(i, 5) == 0, do: "FizzBuzz"
  def fizz_buzz(i) when rem(i, 3) == 0, do: "Fizz"
  def fizz_buzz(i) when rem(i, 5) == 0, do: "Buzz"
  def fizz_buzz(i), do: Integer.to_string(i)
```

After having that function ready, we can just create a stream of numbers, map them to the `fizz_buzz/1` function, take
the first 100 occurrences and print them to the screen:

```elixir
  def solve() do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(&fizz_buzz/1)
    |> Stream.take(100)
    |> Enum.each(&IO.puts/1)
  end
```