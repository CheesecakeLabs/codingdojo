import unittest
import random

suspects = [
    'Charles B. Abbage',
    'Donald Duck Knuth',
    'Ada L. Ovelace',
    'Alan T. Uring',
    'Ivar J. Acobson',
    'Ras Mus Ler Dorf'
]

places = [
    'Redmond',
    'Palo Alto',
    'San Francisco',
    'Tokio',
    'Restaurante no Fim do Universo',
    'São Paulo',
    'Cupertino',
    'Helsinki',
    'Maida Vale',
    'Toronto',
]

weapons = [
    'Peixeira',
    'DynaTAC 8000X',
    'Trezoitão',
    'Trebuchet',
    'Maça',
    'Gládio',
]


def is_theory_correct(suspect, place, weapon, solution):
    wront_solutions = []
    if suspect != solution[0]:
        wront_solutions.append(1)
    if place != solution[1]:
        wront_solutions.append(2)
    if weapon != solution[2]:
        wront_solutions.append(3)

    if wront_solutions:
        return random.choice(wront_solutions)

    return 0


def solve_problem(solution):
    wrong_suspects = []
    wrong_places = []
    wrong_weapons = []

    for suspect_index, _ in enumerate(suspects):
        if suspect_index in wrong_suspects:
            continue
        for place_index, _ in enumerate(places):
            if suspect_index in wrong_suspects: 
                break
            if place_index in wrong_places:
                continue
            for weapon_index, _ in enumerate(weapons):
                if suspect_index in wrong_suspects or place_index in wrong_places:
                    break
                if weapon_index in wrong_weapons:
                    continue

                response = is_theory_correct(suspect_index, place_index, weapon_index, solution)
                if response == 0:
                    return [suspect_index, place_index, weapon_index]
                elif response == 1:
                    wrong_suspects.append(suspect_index)
                elif response == 2:
                    wrong_places.append(place_index)
                elif response == 3:
                    wrong_weapons.append(weapon_index)

    return []


class Testing(unittest.TestCase):

    def setUp(self):
        pass

    def test_is_theory_correct(self):
        self.assertEqual(is_theory_correct(1, 2, 3, [1, 2, 3]), 0)
        self.assertEqual(is_theory_correct(1, 3, 3, [1, 2, 3]), 2)
        self.assertNotEqual(is_theory_correct(3, 3, 3, [1, 2, 3]), 0)
        self.assertIn(is_theory_correct(3, 3, 3, [1, 2, 3]), [1, 2])

    def test_solve_problem(self):
        self.assertEqual(solve_problem([1, 2, 3]), [1, 2, 3])
        self.assertEqual(solve_problem([2, 2, 3]), [2, 2, 3])
        self.assertEqual(solve_problem([4, 2, 3]), [4, 2, 3])

# Executing the tests
if __name__ == '__main__':
    unittest.main()
