import test from 'ava'

const inputs = [

]

const outputs = [

]

// ABC    ->  2
// DEF    ->  3
// GHI    ->  4
// JKL    ->  5
// MNO    ->  6
// PQRS    ->  7
// TUV    ->  8
// WXYZ   ->  9

const map = {
  'A': '2', 'B': '2', 'C': '2',
  'D': '3', 'E': '3', 'F': '3',
  'G': '4', 'H': '4', 'I': '4',
  'J': '5', 'K': '5', 'L': '5',
  'M': '6', 'N': '6', 'O': '6',
  'P': '7', 'Q': '7', 'R': '7', 'S': '7',
  'T': '8', 'U': '8', 'V': '8',
  'W': '9', 'X': '9', 'Y': '9', 'Z': '9',
}


test(t => {
  t.is(getNumber('A'), '2')
  t.is(getNumber('ABC'), '222')
  t.is(getNumber('MY-LOVE'), '69-5683')
  t.is(getNumber('1-HOME-SWEET-HOME'), '1-4663-79338-4663')
  t.is(getNumber('MY-MISERABLE-JOB'), '69-647372253-562')
  t.is(getNumber('MY-MISE7ABLE-JOB'), '69-647372253-562')
})

function getNumber(value) {
  let response = ''

  for (var i = 0; i < value.length; i++) {
    const char = value[i]
    response += map[char] || char
  }

  return response
}
