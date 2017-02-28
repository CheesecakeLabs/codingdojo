import unittest


URINOL_OCCUPIED = 'x'
URINOL_FREE = '.'

# Define your code here
def create_urinol(quantity, occupied):
    urinol = []

    for i in range(quantity):
        urinol.append(URINOL_FREE)

    for i in occupied:
        urinol[i] = URINOL_OCCUPIED

    return urinol

def get_position_of_users(urinol):
    aux = urinol[::]
    positions = []
    for i, urinol in enumerate(aux):
        if i == 0 and aux[i] == URINOL_FREE and aux[i+1] == URINOL_FREE:
            aux[i] = URINOL_OCCUPIED
            positions.append(i)
            continue

        if i == len(aux)-1 and aux[i-1] == URINOL_FREE and aux[i] == URINOL_FREE:
            aux[i] = URINOL_OCCUPIED
            positions.append(i)
            continue

        if aux[i-1] == URINOL_FREE and aux[i] == URINOL_FREE and aux[i+1] == URINOL_FREE:
            aux[i] = URINOL_OCCUPIED
            positions.append(i)
    return positions

def get_number_of_users(urinol):
    return len(get_position_of_users(urinol))

# Define your tests here
class Testing(unittest.TestCase):

    def setUp(self):
        pass

    def test_create_urinol(self):
        self.assertEqual(
            create_urinol(3, [0, 2]),
            [URINOL_OCCUPIED, URINOL_FREE, URINOL_OCCUPIED]
        )

        self.assertEqual(
            create_urinol(5, [0, 2, 4]),
            [URINOL_OCCUPIED, URINOL_FREE, URINOL_OCCUPIED, URINOL_FREE, URINOL_OCCUPIED]
        )

    def test_get_number_of_users(self):
        urinol = create_urinol(3, [0, 2])
        self.assertEqual(
            get_number_of_users(urinol),
            0
        )

        urinol = create_urinol(15, [0, 8, 12])
        self.assertEqual(
            get_number_of_users(urinol),
            5
        )

        urinol = create_urinol(11, [0, 3, 5, 10])
        self.assertEqual(
            get_number_of_users(urinol),
            1
        )

    def test_get_position_of_users(self):
        urinol = create_urinol(3, [0, 2])
        self.assertEqual(
            get_position_of_users(urinol),
            []
        )

        urinol = create_urinol(15, [0, 8, 12])
        self.assertEqual(
            get_position_of_users(urinol),
            [2, 4, 6, 10, 14]
        )

        urinol = create_urinol(11, [0, 3, 5, 10])
        self.assertEqual(
            get_position_of_users(urinol),
            [7]
        )

# Executing the tests
if __name__ == '__main__':
    unittest.main()
