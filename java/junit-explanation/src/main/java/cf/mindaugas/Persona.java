package cf.mindaugas;

import java.util.Objects;

public class Persona {
    int amžius;
    String vardas;
    String pavardis;
    long asmenskodas;

    public Persona(int amžius, String vardas, String pavardis, long asmenskodas) {
        this.amžius = amžius;
        this.vardas = vardas;
        this.pavardis = pavardis;
        this.asmenskodas = asmenskodas;
    }

    public int getAmžius() {
        return amžius;
    }

    public String getVardas() {
        return vardas;
    }

    public String getPavardis() {
        return pavardis;
    }

    public long getAsmenskodas() {
        return asmenskodas;
    }

    @Override
    public boolean equals(Object o) {
        // p1.equals(p2)
        // This      o
//        if (this == o) return true;
//        if (o == null) return false;
//        if (getClass() != o.getClass()) return false;
//        Persona person = (Persona) o;
//
//        return Objects.equals(vardas, person.vardas) &&
//                Objects.equals(pavardis, person.pavardis);
        return true;
    }
}
