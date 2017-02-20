package main

import "testing"

// Your tests go here
func TestMain(t *testing.T) {
	if PrintHelloWorld() != "Hello World!" {
		t.Fatal("Not valid")
	}
}
