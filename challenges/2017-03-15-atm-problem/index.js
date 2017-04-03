import test from 'ava'

const BANK_BILLS = [100, 50, 50, 20, 10, 10, 10, 10, 10, 10, 10, 10]

test(t => {
  t.is(isValidAmount(10), true)
  t.is(isValidAmount(21), false)
  t.is(isValidAmount(21.2), false)
  t.is(isValidAmount(10.11), false)
  t.deepEqual(gimmeMoney(500), [100, 100, 100, 100, 100])
  t.deepEqual(gimmeMoney(50), [50])
  t.deepEqual(gimmeMoney(51), [])
  t.deepEqual(gimmeMoney(470), [100, 100, 100, 100, 50, 20])

  t.deepEqual(gimmeMoney(30), [20, 10])
  t.deepEqual(gimmeMoney(80), [50, 20, 10])

  t.deepEqual(gimmeMoneyFromBank(250, BANK_BILLS), [100, 50, 50, 20, 10, 10, 10])
  t.deepEqual(gimmeMoneyFromBank(1250, BANK_BILLS), [])
  t.is(hasEnoughMoney(250, BANK_BILLS), true)
  t.deepEqual(gimmeMoneyFromBank(300, BANK_BILLS), [100, 50, 50, 20, 10, 10, 10, 10, 10, 10, 10, 10])
  t.deepEqual(gimmeMoneyFromBank(350, BANK_BILLS), [])
})

const ALL_BILLS = [100, 50, 20, 10]

const isValidAmount = (value) => (value % 10 === 0)

const gimmeMoney = (amount) => {
  if (!isValidAmount(amount))
    return []

  let result = []
  let rest = amount
  for (let bill of ALL_BILLS) {
    const numberOfBills = Math.floor(rest / bill)
    rest %= bill
    for (let i = 0; i < numberOfBills; i++ )
      result.push(bill)
  }

  return result
}

const gimmeMoneyFromBank = (amount, bankBills) => {
  if (!isValidAmount(amount)) {
    return []
  }

  if (!hasEnoughMoney(amount, bankBills)) {
    return []
  }

  let result = []
  let rest = amount
  for (let bill of bankBills) {
    if (rest < bill) {
      continue
    }
    rest -= bill
    result.push(bill)
  }
  return result
}

const hasEnoughMoney = (amount, bankBills) =>
  bankBills.reduce((previous, current) => current + previous, 0) >= amount



