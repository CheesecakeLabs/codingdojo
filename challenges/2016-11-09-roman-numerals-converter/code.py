import unittest

roman_values = {
    'I':1,
    'V':5,
    'X':10,
    'L':50,
    'C':100,
    'D':500,
    'M':1000
}

can_subtract = ['I', 'X', 'C']

def check_invalid_number(roman):
    invalid_combinations = [
        'IIII',
        'XXXX',
        'CCCC',
        'MMMM',
    ]
    for invalid_combination in invalid_combinations:
        if roman.find(invalid_combination) >= 0:
            raise Exception
    return roman

def convert_into_decimal(roman):
    roman = check_invalid_number(roman)
    decimal_list = []
    for number in roman:
        decimal_list.append(roman_values[number])

    sum_list = []
    skip = False
    for index, decimal in enumerate(decimal_list):
        if skip:
            skip = False
            continue

        if index < len(decimal_list) - 1 and decimal < decimal_list[index + 1]:
            if decimal not in [1,10,100]:
                raise Exception
            if decimal_list[index + 1] / decimal > 10:
                raise Exception
            sum_list.append(decimal_list[index + 1] - decimal)
            skip = True
        else:
            sum_list.append(decimal)

    sum_list_sorted = sorted(sum_list, reverse=True)

    if sum_list != sum_list_sorted:
        raise Exception

    return sum(sum_list)

class TestDojo(unittest.TestCase):
    def setUp(self):
        self.test_data = [
            ('X', 10),
            ('XX', 20),
            ('XXX', 30),
            ('IX', 9),
            ('MDC', 1600)
        ]

    def test_stuff(self):
        self.assertEquals(convert_into_decimal('X'), 10)
        self.assertEquals(convert_into_decimal('XX'), 20)
        self.assertEquals(convert_into_decimal('XXV'), 25)
        self.assertEquals(convert_into_decimal('IX'), 9)
        self.assertEquals(convert_into_decimal('IV'), 4)
        self.assertEquals(convert_into_decimal('XC'), 90)
        self.assertEquals(convert_into_decimal('MCXX'), 1120)
        self.assertEquals(convert_into_decimal('XIX'), 19)

    def test_invalid(self):
        with self.assertRaises(Exception):
            convert_into_decimal('MMMM')
        with self.assertRaises(Exception):
            convert_into_decimal('IC')
        with self.assertRaises(Exception):
            convert_into_decimal('VLC')
        with self.assertRaises(Exception):
            convert_into_decimal('VX')
        with self.assertRaises(Exception):
            convert_into_decimal('XLC')
        with self.assertRaises(Exception):
            convert_into_decimal('IXX')
        with self.assertRaises(Exception):
            convert_into_decimal('IIX')
        with self.assertRaises(Exception):
            convert_into_decimal('JOJO')

if __name__ == "__main__":
    unittest.main()
