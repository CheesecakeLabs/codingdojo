from .code import get_min_houses_coverage


def test_code():
    houses = [7, 2, 4, 6, 5, 9, 12, 11]
    coverage = 2
    assert get_min_houses_coverage(houses, coverage) == 3

    houses = [1, 2, 4, 5, 8, 12, 13, 15]
    coverage = 2
    assert get_min_houses_coverage(houses, coverage) == 4
