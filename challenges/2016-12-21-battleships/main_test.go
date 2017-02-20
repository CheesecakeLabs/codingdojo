package main

import "testing"

var validBoard = [][]string{
	[]string{"X", ".", ".", "X"},
	[]string{"X", ".", ".", "X"},
	[]string{".", "X", ".", "X"},
}

func TestCountBattleships(t *testing.T) {
	if CountBattleships(validBoard) != 3 {
		t.Fatal("Not valid")
	}
}

func TestIsBattleships(t *testing.T) {
	if !IsGhostBattleship("X") {
		t.Fatal("Not valid")
	}

	if IsGhostBattleship(".") {
		t.Fatal("Not valid")
	}
}