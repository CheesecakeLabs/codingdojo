# Challenge

## Distribuição de Mictórios

http://dojopuzzles.com/problemas/exibe/distribuicao-de-mictorios/

> Este problema foi utilizado em 204 Dojo(s).
>
> Um problema enfrentado pelos homens no uso de mictórios em banheiros públicos é o constrangimento causado por outro
homem urinando no mictório ao lado. Uma situação contrangedora é definida quando dois "mijões" deveriam ocupar mictórios
adjacentes.
>
> Dada uma quantidade de mictórios em um banheiro e a ocupação inicial deles (informando em qual deles já existe um
"mijão"), determine quantos "mijões" ainda podem usar os mictórios e qual a posição deles antes para que não ocorra uma
situação constrangedora.

# Solution

Language of choice: Python

## Running the code

`python code.py`

## Explanation:

We are considering the input to be a list of numbers. The list size is the total number of urinols, and its availability
is being represented by either a `0` (for empty urinols) or a `1` (for occupied).

Our expected output is a list of positions, where the list size is an indication of the total number of men who can
join in on the peeing without causing embarrassment.

So here are some test cases:

| Input                               | Output     |
| ----------------------------------- | ---------- |
| `[0]`                               | `[0]`      |
| `[0,0]`                             | `[0]`      |
| `[0,0,0,0,0,0,1,1,1,0,1]`           | `[0,2,4]`  |
| `[1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]` | `[2,4,12]` |

To achieve this, we have defined two functions: `get_availables()` and `get_peers()`.

The function `get_availables()` lists the urinols which don't have anyone besides them. We can interpret this as the
options a man has when given the initial state.

To compute this, we group urinols in threes and then filter those which have no `1`s:

```python
def get_availables(urinols):
    availables = zip([0] + urinols[:-1], urinols, urinols[1:] + [0])
    availables = zip(availables, range(len(availables)))
    availables = [
        i[1] for i in availables if i[0] == (0, 0, 0)
    ]
    return availables
```

The function `get_peers()` goes one step further in order to compute the complete occupation. It starts out listing
available urinols and choosing the first one. After that, it recursively calls itself with the new occupation:

```python
def get_peers(urinols):
    availables = get_availables(urinols)

    if availables:
        index = availables[0]
        urinols[index] = 1
        return [index] + get_peers(urinols)

    return []
```
