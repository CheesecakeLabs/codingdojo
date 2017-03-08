import test from 'ava'

const inputs = [

]

const outputs = [

]

test(t => {
  t.deepEqual(countString('aaabbc'), [{a: 3}, {b: 2}, {c: 1}])
  t.deepEqual(countString('aaabbca'), [{a: 4}, {b: 2}, {c: 1}])
  t.deepEqual(countString('aaabbbbbbca'), [{b: 6}, {a: 4}, {c: 1}])
  t.deepEqual(countString('aaab bbbb bca'), [{b: 6}, {a: 4}, {' ': 2}, {c: 1}])
  t.deepEqual(countString('aaab bbbb baaca'), [{a: 6}, {b: 6}, {' ': 2}, {c: 1}])
  t.deepEqual(countString('baaa bbbb baaca'), [{a: 6}, {b: 6}, {' ': 2}, {c: 1}])
  t.deepEqual(countString('baaa bbbb baaca    '), [{' ': 6}, {a: 6}, {b: 6}, {c: 1}])
  t.deepEqual(countString('Coding do jojo'), [{o: 4}, {' ': 2}, {d: 2}, {j: 2}, {C: 1}, {g: 1}, {i: 1}, {n: 1}])
})

test(t => {
  t.deepEqual(functionalCountString('aaabbc'), [{a: 3}, {b: 2}, {c: 1}])
  t.deepEqual(functionalCountString('aaabbca'), [{a: 4}, {b: 2}, {c: 1}])
  t.deepEqual(functionalCountString('aaabbbbbbca'), [{b: 6}, {a: 4}, {c: 1}])
  t.deepEqual(functionalCountString('aaab bbbb bca'), [{b: 6}, {a: 4}, {' ': 2}, {c: 1}])
  t.deepEqual(functionalCountString('aaab bbbb baaca'), [{a: 6}, {b: 6}, {' ': 2}, {c: 1}])
  t.deepEqual(functionalCountString('baaa bbbb baaca'), [{a: 6}, {b: 6}, {' ': 2}, {c: 1}])
  t.deepEqual(functionalCountString('baaa bbbb baaca    '), [{' ': 6}, {a: 6}, {b: 6}, {c: 1}])
  t.deepEqual(functionalCountString('Coding do jojo'), [{o: 4}, {' ': 2}, {d: 2}, {j: 2}, {C: 1}, {g: 1}, {i: 1}, {n: 1}])
})

const functionalCountString = (str) => {
  return str.split('').reduce((previous, current) => {
    const charVerificationArray = previous.filter((value) => Object.keys(value).includes(current))

    if (charVerificationArray.length) {
      const key = Object.keys(charVerificationArray[0])
      const value = charVerificationArray[0][key] + 1
      return [
        ...previous,
        {[key]: value}
      ]
    }

    return [
      ...previous,
      {[current]: 1}
    ]
  }, [])
}

function countString (str) {
  let charMap = {}
  let charOutput = []

  for (let char of str) {
    if (!charMap[char]) {
      charMap[char] = 1
    } else {
      charMap[char] += 1
    }
  }

  for (let key of Object.keys(charMap)) {
    charOutput.push({
      [key]: charMap[key]
    })
  }

  return charOutput.sort((a, b) => {
    if (a[Object.keys(a)] === b[Object.keys(b)]) {
      return Object.keys(a) > Object.keys(b)
    }
    return a[Object.keys(a)] < b[Object.keys(b)]
  })
}

