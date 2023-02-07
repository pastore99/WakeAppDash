package beans;

public class Emozioni {
    private double neutrale;
    private double disgustato;
    private double felice;
    private double impaurito;
    private double arrabbiato;
    private double sorpreso;
    private double triste;

    public Emozioni() {
        this.neutrale = 0;
        this.disgustato = 0;
        this.felice = 0;
        this.impaurito = 0;
        this.arrabbiato = 0;
        this.sorpreso = 0;
        this.triste = 0;
    }
    public Emozioni(double neutrale, double disgustato, double felice, double impaurito, double arrabbiato, double sorpreso, double triste) {
        this.neutrale = neutrale;
        this.disgustato = disgustato;
        this.felice = felice;
        this.impaurito = impaurito;
        this.arrabbiato = arrabbiato;
        this.sorpreso = sorpreso;
        this.triste = triste;
    }

    public double getNeutrale() {
        return neutrale;
    }

    public double getDisgustato() {
        return disgustato;
    }

    public double getFelice() {
        return felice;
    }

    public double getImpaurito() {
        return impaurito;
    }

    public double getArrabbiato() {
        return arrabbiato;
    }

    public double getSorpreso() {
        return sorpreso;
    }

    public double getTriste() {
        return triste;
    }

    public void setNeutrale(double neutrale) {
        this.neutrale = neutrale;
    }

    public void setDisgustato(double disgustato) {
        this.disgustato = disgustato;
    }

    public void setFelice(double felice) {
        this.felice = felice;
    }

    public void setImpaurito(double impaurito) {
        this.impaurito = impaurito;
    }

    public void setArrabbiato(double arrabbiato) {
        this.arrabbiato = arrabbiato;
    }

    public void setSorpreso(double sorpreso) {
        this.sorpreso = sorpreso;
    }

    public void setTriste(double triste) {
        this.triste = triste;
    }
}
