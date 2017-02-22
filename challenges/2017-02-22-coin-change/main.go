package main

// Your code goes here
func PrintHelloWorld() string {
	return "Hello World!"
}


func Sum(array []int) int {
	total := 0
	for _, value := range(array) {
		total += value
	}
	return total
}

func Combinations(amount int, coins []int) int {
		total := 0
		
		for _, value := range(coins) {

			newAmount := amount - value

			if newAmount == 0 {
				total += 1
			} else if newAmount > 0 {
				total += Combinations(newAmount, coins
			} else {
				total += 0
			}
		}
		return total
}

func main() {
}
