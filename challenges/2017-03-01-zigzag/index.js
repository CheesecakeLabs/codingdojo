import test from 'ava'

test(t => {
  t.is(converter('PAYPALISHIRING', 3), 'PAHNAPLSIIGYIR')
  t.is(converter('TOBEORNOTTOBETHATSTHEQUESTION', 8), 'THNOTAOBETIEBSTOOTSRTHENTEUOQ')
})

function converter(text, numberOfRows) {

	let lowerBound = 0
	let upperBound = numberOfRows - 1
	let col = 0
	let row = 0
	let desc = true

	let matrix = []

	text.split('').forEach((x, i) => {
		if (!matrix[row])
			matrix[row] = []
		matrix[row][col] = x

		if (desc) {
			row += 1
		}	else {
			row -= 1
			col += 1
		}
		if (row == upperBound) {
			desc = false
		}
		
		if (row == lowerBound) {
			desc = true
		}
	})

	return matrix.map(row => row.join('')).join('')
}

