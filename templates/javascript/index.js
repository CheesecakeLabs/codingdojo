import test from 'ava'

const inputs = [

]

const outputs = [

]

test(t => {
  t.is(sum(1, 1), 2)
})

function sum (a, b) {
  return a + b
}
