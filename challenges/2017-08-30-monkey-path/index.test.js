const riverPathAtTime = (path, time) =>
  path.map(stone => stone <= time && stone >= 0 ? 1 : 0)

const canCrossThePath = (path, distance) => {
  for(let i = 0, valid ; i < path.length ; i++) {
    valid = false
    for(let j = 0 ; j < distance ; j++) {
      if (path[i + j] === 1 || path[i + j] === undefined) {
        valid = true
      }
    }
    if (!valid) {
      return false
    }
  }
  return true
}

const validTimeToCrossRiver = (path, distance) => {
  const highestTime =
    path.reduce((higherPosition, position) =>
      position > higherPosition ? position : higherPosition, 0)
  for(let currentTime = 1 ; currentTime <= highestTime ; currentTime++) {
    const currentPath = riverPathAtTime(path, currentTime)
    const canCross = canCrossThePath(currentPath, distance)
    if (canCross) {
      return currentTime
    }
  }
  return -1
}

test('river path at given time', () => {
  expect(riverPathAtTime([3, 2, 1], 0)).toEqual([0, 0, 0])
  expect(riverPathAtTime([3, 2, 1], 1)).toEqual([0, 0, 1])
  expect(riverPathAtTime([3, 2, 1], 2)).toEqual([0, 1, 1])
  expect(riverPathAtTime([3, 2, 1], 3)).toEqual([1, 1, 1])
  expect(riverPathAtTime([3, 2, 1], 4)).toEqual([1, 1, 1])
})

test('check if can jump river stones at a normalized path', () => {
  expect(canCrossThePath([0, 0, 0, 0, 0, 0], 2)).toBe(false)
  expect(canCrossThePath([1, 1, 1, 0, 1, 0], 2)).toBe(true)
  expect(canCrossThePath([1, 1, 0, 1, 0, 1], 2)).toBe(true)
  expect(canCrossThePath([1, 0, 1, 0, 0, 0], 2)).toBe(false)
  expect(canCrossThePath([1, 1, 1, 1, 1, 1], 1)).toBe(true)
  expect(canCrossThePath([1, 1, 1, 1, 0, 1], 1)).toBe(false)
  expect(canCrossThePath([0, 0, 0, 0, 0], 6)).toBe(true)
  expect(canCrossThePath([0, 0, 0, 0, 0, 0], 6)).toBe(false)
  expect(canCrossThePath([0, 0, 1, 0, 0, 1, 0], 3)).toBe(true)
})

test('earliest moment monkey can jump', () => {
  expect(validTimeToCrossRiver([3, 2, 1], 1)).toEqual(3)
  expect(validTimeToCrossRiver([1, 2, 1], 1)).toEqual(2)
  expect(validTimeToCrossRiver([1, 2, 1], 3)).toEqual(1)
  expect(validTimeToCrossRiver([1, -1, 0, 2, 3, 5], 3)).toEqual(2)
  expect(validTimeToCrossRiver([1, 2, 3, 4, -1, -1, -1], 1)).toEqual(-1)
})
