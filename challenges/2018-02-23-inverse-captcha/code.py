import unittest


# Define your code here
def sum_numbers(input):
    return sum([int(value) for i, value in enumerate(input) if is_previous_the_same(input, i)])


def is_previous_the_same(input, index):
    return input[-1] == input[index] if index == 0 else input[index-1] == input[index]


# Define your tests here
class Testing(unittest.TestCase):
    def setUp(self):
        pass

    def test_is_previous_same(self):
        self.assertEqual(is_previous_the_same("1122", 0), False)
        self.assertEqual(is_previous_the_same('1122', 1), True)
        self.assertEqual(is_previous_the_same('1122', 2), False)
        self.assertEqual(is_previous_the_same('1122', 3), True)

        for i, value in enumerate('91212129'):
            if i == 0:
                self.assertEqual(is_previous_the_same('91212129', i), True)
            else:
                self.assertEqual(is_previous_the_same('91212129', i), False)

    def test_sum(self):
        self.assertEqual(sum_numbers('91212129'), 9)
        self.assertEqual(sum_numbers('1234'), 0)
        self.assertEqual(sum_numbers('1111'), 4)
        self.assertEqual(sum_numbers('1122'), 3)


# Executing the tests
if __name__ == '__main__':
    unittest.main()
