package beans;

import java.io.Serializable;

public class Emozioni implements Serializable {
    private int neutrale;
    private int disgustato;
    private int felice;
    private int impaurito;
    private int arrabbiato;
    private int sorpreso;
    private int triste;

    public Emozioni() {
        this.neutrale = 0;
        this.disgustato = 0;
        this.felice = 0;
        this.impaurito = 0;
        this.arrabbiato = 0;
        this.sorpreso = 0;
        this.triste = 0;
    }
    public Emozioni(int neutrale, int disgustato, int felice, int impaurito, int arrabbiato, int sorpreso, int triste) {
        this.neutrale = neutrale;
        this.disgustato = disgustato;
        this.felice = felice;
        this.impaurito = impaurito;
        this.arrabbiato = arrabbiato;
        this.sorpreso = sorpreso;
        this.triste = triste;
    }

    public int getNeutrale() {
        return neutrale;
    }

    public int getDisgustato() {
        return disgustato;
    }

    public int getFelice() {
        return felice;
    }

    public int getImpaurito() {
        return impaurito;
    }

    public int getArrabbiato() {
        return arrabbiato;
    }

    public int getSorpreso() {
        return sorpreso;
    }

    public int getTriste() {
        return triste;
    }

    public void setNeutrale(int neutrale) {
        this.neutrale = neutrale;
    }

    public void setDisgustato(int disgustato) {
        this.disgustato = disgustato;
    }

    public void setFelice(int felice) {
        this.felice = felice;
    }

    public void setImpaurito(int impaurito) {
        this.impaurito = impaurito;
    }

    public void setArrabbiato(int arrabbiato) {
        this.arrabbiato = arrabbiato;
    }

    public void setSorpreso(int sorpreso) {
        this.sorpreso = sorpreso;
    }

    public void setTriste(int triste) {
        this.triste = triste;
    }
}
