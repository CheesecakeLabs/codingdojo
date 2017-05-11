import test from 'ava'

let state = [['x', '', ''],
                   ['', '', ''],
                   ['', '', '']]

const emptyState = [['', '', ''],
                   ['', '', ''],
                   ['', '', '']]

test(t => {
  t.deepEqual(emptyState, [['', '', ''],
                          ['', '', ''],
                          ['', '', '']])
  t.deepEqual(state, play(emptyState, 'x', 0, 0))
  t.deepEqual(state, play(state, 'o', 0, 0))
  t.is(check([['x', '', ''],
              ['', '', ''],
              ['', '', '']], [[0,0],[0,1],[0,2]]), false)
  t.is(check([['', '', ''],
              ['', '', ''],
              ['', '', '']], [[0,0],[0,1],[0,2]]), false)
  t.is(check([['x', 'x', 'x'],
              ['', '', ''],
              ['', '', '']], [[0,0],[0,1],[0,2]]), true)
  t.is(check([['x', 'o', 'x'],
              ['', '', ''],
              ['', '', '']], [[0,0],[0,1],[0,2]]), false)
  t.is(check([['x', 'o', 'x'],
              ['', 'x', ''],
              ['', '', 'x']], [[0,0],[1,1],[2,2]]), true)
  t.is(didWin([['x', 'o', 'x'],
              ['', 'x', ''],
              ['', '', 'x']]), true)
  t.is(didWin([['x', 'o', 'x'],
              ['', 'o', ''],
              ['', '', 'x']]), false)
  t.is(didWin([['x', 'o', 'o'],
               ['', 'o', ''],
               ['o', '', 'x']]), true)
})

const check = (state, positions) => {
  const pos1 = state[positions[0][0]][positions[0][1]]
  const pos2 = state[positions[1][0]][positions[1][1]]
  const pos3 = state[positions[2][0]][positions[2][1]]
  return pos1 === pos2 && pos2 === pos3 && ['x', 'o'].includes(pos1)
}

const play = (state, player, line, col) => {
  if (state[col][line] !== ''){
    return state
  }

  let newState = [...state]
  newState[col][line] = player

  return newState
}

const didWin = (state) => {
  const array = [
                 [[0,0], [0,1], [0,2]],
                 [[1,0], [1,1], [1,2]],
                 [[2,0], [2,1], [2,2]],

                 [[0,0], [1,0], [2,0]],
                 [[0,1], [1,1], [2,1]],
                 [[0,2], [1,2], [2,2]],

                 [[0,0], [1,1], [2,2]],
                 [[0,2], [1,1], [2,0]],
                ]
  return array.some((array) => check(state, array))
}
