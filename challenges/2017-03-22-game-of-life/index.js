import test from 'ava'

const initialMatrix = [
  [1, 1, 0],
  [1, 0, 1],
  [0, 0, 1],
]

const finalMatrix = [
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 0]
]

const nextFinalMatrix = [
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 0]
]

const anotherInitialMatrix = [
  [1, 0, 1],
  [0, 1, 1],
  [0, 1, 0],
]

const anotherFinalMatrix = [
  [0, 0, 1],
  [1, 0, 1],
  [0, 1, 1],
]

test(t => {
  t.is(calcNumNeighbors(initialMatrix, 0, 0), 2)
  t.is(calcNumNeighbors(initialMatrix, 1, 1), 5)
  t.is(calcNumNeighbors(initialMatrix, 2, 2), 1)
  t.is(calcNumNeighbors(initialMatrix, 3, 3), 0)
  t.deepEqual(nextCellState(1, 2), 1)
  t.deepEqual(nextCellState(1, 3), 1)
  t.deepEqual(nextCellState(1, 1), 0)
  t.deepEqual(nextCellState(1, 4), 0)
  t.deepEqual(nextCellState(0, 2), 0)
  t.deepEqual(nextCellState(0, 3), 1)
  t.deepEqual(nextCellState(0, 1), 0)
  t.deepEqual(nextCellState(0, 4), 0)
  t.deepEqual(nextStep(initialMatrix), finalMatrix)
  t.deepEqual(nextStep(finalMatrix), nextFinalMatrix)
  t.deepEqual(nextStep(anotherInitialMatrix), anotherFinalMatrix)
})

function calcNumNeighbors(matrix, lin, col) {
  let neighbors = 0

  if (lin < 0 || lin >= matrix.length || col < 0 || col >= matrix[0].length) {
    return 0
  }

  for (let line = lin-1; line <= lin +1 ; line++) {
    if (line < 0 || line >= matrix.length)
      continue
    for (let column = col-1; column <= col +1 ; column++) {
      if (column < 0 || column >= matrix[0].length)
        continue
      if (lin === line && col === column)
        continue
      neighbors += matrix[line][column]
    }
  }
  return neighbors
}

function nextCellState(currentState, numberOfNeighbors) {
  if (numberOfNeighbors < 2 || numberOfNeighbors > 3) {
    return 0
  }
  if (currentState == 0 && numberOfNeighbors == 2){
    return 0
  }
  return 1
}

function nextStep(matrix) {
  const resultMatrix = [[], [], []]
  for (let line = 0; line < matrix.length ; line++) {
    for (let column = 0; column < matrix[line].length ; column++) {
      const neighbors = calcNumNeighbors(matrix, line, column)
      const currentState = matrix[line][column]
      resultMatrix[line][column] = nextCellState(currentState, neighbors)
    }
  }
  return resultMatrix
}
