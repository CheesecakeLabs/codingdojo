const sum = (a, b) => a + b
const sumAll = (...args) => args.reduce(sum, 0)

test('some name', () => {
  expect(sum(1, 1)).toBe(2)
  expect(sum('1', 1)).not.toBe(2) // '11'
  expect(sumAll(1, 1, 1, 1)).toBe(4)
  expect(sumAll(10, 11, 12, 13)).toBe(46)
  expect(sumAll(33)).toBe(33)
})

