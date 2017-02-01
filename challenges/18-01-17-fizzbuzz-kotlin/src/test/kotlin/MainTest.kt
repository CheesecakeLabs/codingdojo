import org.junit.Test
import java.util.*
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Created by marciorodrigues on 18/01/17.
 */

class MainTest {

    @Test fun testFizzBuzz() {
        val main = Main()
        var n = 1
        var expected = arrayOf("1",
                "2",
                "Fizz",
                "4",
                "Buzz",
                "Fizz",
                "7",
                "8",
                "Fizz",
                "Buzz",
                "11",
                "Fizz",
                "13",
                "14",
                "FizzBuzz"
        )
        assertTrue { Arrays.equals(expected, main.fizzBuzz(n)) }

        n = 0
        expected = arrayOf()
        assertTrue { Arrays.equals(expected, main.fizzBuzz(n)) }
    }

}