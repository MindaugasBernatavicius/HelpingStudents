package cf.mindaugas;

import org.junit.*;

public class CalculatorTest {

    // Illustrating fixtures

    @BeforeClass
    public static void testBC(){
        System.err.println("@BeforeClass");
    }

    @AfterClass
    public static void testAC(){
        System.err.println("@AfterClass");
    }

    @Before
    public void testB(){
        System.err.println("@Before");
    }

    @After
    public void testA(){
        System.err.println("@After");
    }

    @Test
    public void testAdd(){
        System.err.println("testAdd()");
        int firstN = 1;
        int secondN = 1;
        int result = Calculator.add(firstN, secondN);
        Assert.assertEquals(2, result);
    }

    @Test
    public void testSubtract(){
        System.err.println("testSubtract()");
        int firstN = 1;
        int secondN = 1;
        int result = Calculator.subtract(firstN, secondN);
        Assert.assertEquals(0, result);
    }
}
