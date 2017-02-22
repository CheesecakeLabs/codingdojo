package main

import "testing"

// Your tests go here
func TestMain(t *testing.T) {
	if PrintHelloWorld() != "Hello World!" {
		t.Fatal("Not valid")
	}

	if Combinations(10, []int{10}) != 1 {
		t.Fatal("Not valid")
	}

	if Combinations(3, []int{2}) != 0 {
		t.Fatal("Not valid")
	}			
	
	test := Combinations(5, []int{1,2,5})
	if test != 4 {
		t.Fatal("Not valid ", test)
	}

	test2 := Combinations(5, []int{5,2,1})
	if test2 != 4 {
		t.Fatal("Not valid ", test2)
	}
}
