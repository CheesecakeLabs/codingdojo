# Challenge

## Monkey Path
A monkey wants to get to the other side of a river. The monkey is initially located on one bank of the river (position -1) and wants to get to the opposite bank (position N). The monkey can jump any (integer) distance between 1 and D. If D is less than or equal to N then the monkey cannot jump across the river. Luckily, there are many stones hidden under the water. The monkey can jump to and from the stones, but only when the particular stone is already out of the water.

The stones in the river are described in array A consisting of N integers. A[K] represents a time when the stone at position K will be out of the water (A[K] = -1 means that there is no stone at position K). You can assume that no two stones will surface simultaneously. The goal is to find the earliest time when the monkey can get to the other side of the river.

For example, consider integer D = 3 and the following array A consisting of N = 6 integers:

```
A[0] =  1
A[1] = -1
A[2] =  0
A[3] =  2
A[4] =  3
A[5] =  5
```

Initially , the monkey cannot jump across the river in a single jump. However, at time 2, there will be three stones out of water.

Time 2 is the earliest moment when the monkey can jump across the river (for example, by jumps of length 1, 3 and 3, as marked on the picture above).

Write a function:

`function solution(A, D)`

that, given a zero-indexed array A consisting of N integers, and integer D, returns the earliest time when the monkey can jump to the other side of the river. If the money can leap across the river in just one jump, the function should return 0. If the monkey is never able to jump to the other side of the river, the function should return -1.

For example, given array A and integer D as defined above, the function should return 2 as explained above.

For given A = [3, 2, 1] and D = 1, the function should return 3, since the monkey has to wait for each stone.

For given A = [1, 2, 3, 4, -1, -1, -1] and D = 3, the function should return -1, since the monkey will never get to the other side of the river.

# Javascript Template

## Install

`npm install`

## Run

`npm test`
