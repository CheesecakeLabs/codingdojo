import test from 'ava'

test(t => {
  t.is(charToNumeric('a'), 1)
  t.is(charToNumeric('z'), 26)
  t.is(charToNumeric('A'), 27)
  t.is(charToNumeric('Z'), 52)
  t.is(stringToNumeric('ab'), 3)
  t.is(stringToNumeric('abAC'), 59)
  t.is(isPrime(4),false)
  t.is(isPrime(3),true)
  t.is(isPrime(367),true)
  t.is(isStringNumericPrime('abAC'), true)
  t.is(isStringNumericPrime('ZZZZZ'), false)
})

function charToNumeric(char) {
  const numeric = char.charCodeAt(0) - 96

  if (numeric > 0) {
    return numeric
  }
  return numeric + 58
}

function stringToNumeric(string) {
  var number = 0

  for (var c of string) {
    number += charToNumeric(c)
  }
  return number
}

function isPrime(number) {
  for (var i = 2; i <= number / 2; i++){
    if (number % i === 0){
      return false
    }
  }
  return true
}

function isStringNumericPrime(inputString) {
  return isPrime(stringToNumeric(inputString))
}
