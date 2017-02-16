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
        assertEquals(main.sum(1, 2), 3)
    }

}