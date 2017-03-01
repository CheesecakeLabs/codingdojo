import unittest


def converter(text, num_rows):
    if not text or num_rows <= 1:
        return text

    result = []

    # TOP ROW
    for i in range(0, len(text), 2 * num_rows - 2):
        result.append(text[i])

    # MIDDLE ROWS
    for i in range(1, num_rows - 1):
        steps = [(num_rows - 1 - i) * 2, i * 2]
        flag = True
        pos = i
        while pos < len(text):
            result.append(text[pos])
            pos += steps[0] if flag else steps[1]
            flag = not flag

    # BOTTOM ROW
    for i in range(num_rows - 1, len(text), 2 * num_rows - 2):
        result.append(text[i])

    return ''.join(result)


class TestConvert(unittest.TestCase):
    def test_1(self):
        self.assertEqual(
            converter("PAYPALISHIRING", 3),
            "PAHNAPLSIIGYIR"
        )

    def test_2(self):
        self.assertEqual(
            converter("AB", 2),
            "AB"
        )

    def test_3(self):
        self.assertEqual(
            converter('TOBEORNOTTOBETHATSTHEQUESTION', 8),
            'THNOTAOBETIEBSTOOTSRTHENTEUOQ'
        )


if __name__ == "__main__":
    unittest.main()
