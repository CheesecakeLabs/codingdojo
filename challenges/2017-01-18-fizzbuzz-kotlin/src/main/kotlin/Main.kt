import java.util.*

/**
 * Created by marciorodrigues on 18/01/17.
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
