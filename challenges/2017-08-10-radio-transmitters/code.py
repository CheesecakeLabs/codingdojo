def get_min_houses_coverage(houses, coverage):
    sorted_houses = sorted(houses)
    towers = 0
    end_coverage = 0

    for house in sorted_houses:
        if house <= end_coverage:
            continue

        coverage_range = range(house + coverage, house - 1, -1)
        for cr in coverage_range:
            if cr in sorted_houses:
                end_coverage = cr + coverage
                towers += 1
                break

    return towers
