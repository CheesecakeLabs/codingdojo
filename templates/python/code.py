import unittest


# Define your code here
def hello_world():
    return 'Hello world'


# Define your tests here
class Testing(unittest.TestCase):

    def setUp(self):
        pass

    def test_hello_world(self):
        self.assertEqual(hello_world(), 'Hello world')

# Executing the tests
if __name__ == '__main__':
    unittest.main()
