test('Lets test!', () => {
  expect(distance({ x: 9, y: 5}, { x: 9, y: 4})).toBe(1)

  expect(distance({ x: 9, y: 5}, { x: 9, y: 3})).not.toBe(1)

  expect(distanceToAllPoints({x:0, y:0}, [{x:3, y:4}, {x:1, y:0}]))
  	.toEqual([{d: 5, point: {x: 3, y: 4}}, {d: 1, point: {x: 1, y: 0}}])

  expect(findThreeClosestPoints({x:0, y:0}, [{x:3, y:4}, {x:1, y:0}]))
  	.toEqual([{d: 1, point: {x:1, y:0}}, {d: 5, point: {x:3, y:4}}])

  expect(findThreeClosestPoints({x:0, y:0}, POINTS))
  	.toEqual(
  	[
  		{
  			d: 5,
  		 	point: { x:3, y:4 }
  		},
  		{
  		 	d: 8,
  		 	point: { x:2, y:8 }
  		},
  		{
  		 	d: 9,
  		 	point: { x:9, y:2 }
  		}
  	])
})

const POINTS = [
	{
		x: 3,
		y: 4,
	},
	{
		x: 1,
		y: 10,
	},
	{
		x: 2,
		y: 8,
	},
	{
		x: 3,
		y: 13,
	},
	{
		x: 30,
		y: 2,
	},
	{
		x: 9,
		y: 2,
	},
	{
		x: 12,
		y: 2,
	},
]

const distance = (point1, point2) => 
	Math.round(Math.sqrt(
		(point1.x - point2.x)*(point1.x - point2.x) +
		(point1.y - point2.y)*(point1.y - point2.y)
	))

const distanceToAllPoints = (point1, otherPoints) => 
	otherPoints.map(point2 => ({
		d: distance(point1, point2), 
		point: point2
	}))

const findThreeClosestPoints = (point, otherPoints) => 
  distanceToAllPoints(point, otherPoints)
  	.sort((p1, p2) => p1.d - p2.d)
  	.slice(0,3)
