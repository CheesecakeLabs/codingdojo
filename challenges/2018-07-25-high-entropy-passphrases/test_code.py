import unittest


def split_words(passphrase):
    return passphrase.split(" ")


def count_words(word_list):
    word_counter = {}
    for word in word_list:
        if word not in word_counter.keys():
            word_counter[word] = 1
        else:
            word_counter[word] += 1

    return word_counter


def check_duplicates(word_counter):
    word_values = set(word_counter.values())
    if len(word_values) > 1:
        return False
    return True


# 1-liner:
is_valid_passphrase2 = lambda word: len(word.split(" ")) == len(set(word.split(" ")))


class Testing(unittest.TestCase):

    def setUp(self):
        pass

    def test_split_words(self):
        self.assertEqual(split_words("aa bb cc dd ee"), ["aa", "bb", "cc", "dd", "ee"])

    def test_count_words(self):
        self.assertEqual(count_words(["aa", "bb", "cc", "dd", "ee"]),
        {
            "aa": 1,
            "bb": 1,
            "cc": 1,
            "dd": 1,
            "ee": 1,
        })

        self.assertEqual(count_words(["aa", "aa", "cc", "dd", "ee"]),
        {
            "aa": 2,
            "cc": 1,
            "dd": 1,
            "ee": 1,
        })

    def test_check_duplicates(self):
        self.assertEqual(check_duplicates({
            "aa": 2,
            "cc": 1,
            "dd": 1,
            "ee": 1,
        }), False)
        self.assertEqual(check_duplicates({
            "aa": 1,
            "cc": 1,
            "dd": 1,
            "ee": 1,
        }), True)

    def test_oneliner(self):
        self.assertEqual(is_valid_passphrase2("aa bb cc dd ee"), True)
        self.assertEqual(is_valid_passphrase2("aa bb cc dd ee aa"), False)

# Executing the tests
if __name__ == '__main__':
    unittest.main()
