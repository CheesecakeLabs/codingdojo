import java.util.*

/**
 * Created by marciorodrigues on 18/01/17.
 */

/**
Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”.
For numbers which are multiples of both three and five output “FizzBuzz”.
 */

fun main(args : Array<String>) {

}

class Main {

    fun fizzBuzz(input: Int) : Array<String> {
        if (input < 1) { return arrayOf() }

        val multiples = Array(size = input) {""}

        for (n in 1..input) {
            var stringVar = ""

            if (n % 3 == 0) {
                stringVar += "Fizz"
            }

            if (n % 5 == 0) {
                stringVar += "Buzz"
            }

            if (stringVar.isEmpty()) {
                stringVar = n.toString()
            }

            multiples[n - 1] = stringVar
        }

        return multiples
    }

}