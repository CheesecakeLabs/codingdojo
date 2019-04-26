import unittest


def get_availables(urinols):
    availables = zip([0] + urinols[:-1], urinols, urinols[1:] + [0])
    availables = zip(availables, range(len(availables)))
    availables = [
        i[1] for i in availables if i[0] == (0,0,0) 
    ]
    return availables

def get_peers(urinols):

    if get_availables(urinols):
        index = get_availables(urinols)[0]
        new_urinols = urinols
        new_urinols[index] = 1
        return [index] + get_peers(new_urinols)

    return []


# Define your tests here
class Testing(unittest.TestCase):

    def setUp(self):
        pass

    def test_availables(self):
        self.assertEqual(get_availables([0,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [0,1,2,3,4,12])

    def test_peers(self):
        self.assertEqual(get_peers([0]), [0])
        self.assertIn(get_peers([0, 0]), [[0], [1]])
        self.assertEqual(get_peers([0,0,0,0,0,0,1,1,1,0,1]), [0,2,4])
        self.assertEqual(get_peers([0,0,0,0,0,0,1,0,1,0,1]), [0,2,4])
        self.assertEqual(get_peers([0,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [0,2,4,12])
        self.assertEqual(get_peers([1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0]), [2,4,12])

# Executing the tests
if __name__ == '__main__':
    unittest.main()
