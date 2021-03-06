import unittest


def get_availables(urinols):
    availables = zip([0] + urinols[:-1], urinols, urinols[1:] + [0])
    return [ i[0] for i in enumerate(availables) if i[1] == (0, 0, 0) ]


def get_peers(urinols):
    availables = get_availables(urinols)

    if availables:
        index = availables[0]
        urinols[index] = 1
        return [index] + get_peers(urinols)

    return []


class Testing(unittest.TestCase):

    def test_availables(self):
        self.assertEqual(get_availables([0,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [0,1,2,3,4,12])

    def test_peers(self):
        self.assertEqual(get_peers([0]), [0])
        self.assertEqual(get_peers([0,0]), [0])
        self.assertEqual(get_peers([0,0,0,0,0,0,1,1,1,0,1]), [0,2,4])
        self.assertEqual(get_peers([0,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [0,2,4,12])
        self.assertEqual(get_peers([1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [2,4,12])


# Executing the tests
if __name__ == '__main__':
    unittest.main()
