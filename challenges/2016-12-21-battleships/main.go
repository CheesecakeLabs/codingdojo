package main

import (
	"fmt"
)

func CountBattleships(board [][]string) int {

	totalShips := 0

	for line := 0; line < len(board); line++ {
		for column := 0; column < len(board[line]); column++ {
			position := board[line][column]
			fmt.Print(board[line][column])

			if IsGhostBattleship(position) {
				if (line-1 >= 0 && IsGhostBattleship(board[line-1][column])) ||
					(column-1 >= 0 && IsGhostBattleship(board[line][column-1])) {
					continue
				}
				totalShips++
			}
		}
		fmt.Println("")
	}
	return totalShips
}

func IsGhostBattleship(position string) bool {
	return position == "X"
}

func main() {
}
