package cf.mindaugas;

import org.junit.Assert;
import org.junit.Test;

public class PersonaTest {
    @Test
    public void testEquality() {
        Persona p1 = new Persona(23, "Petriukas", "Karbauskis", 38534236756L);
        Persona p2 = new Persona(11, "Petriukas", "Gražuliukas", 34534236756L);
        Assert.assertEquals(p1, p2);
    }
}
