package beans;
import java.util.Date;

public class ParametriAmbientali {
    private Integer id;
    private Integer quantitaCo2;
    private Date dataInizio;
    private Date dataFine;
    private  Integer luminosita;
    private double quantitaAps25;
    private double quantitaPm10;
    private String idUtente;

    public ParametriAmbientali() {}
    public ParametriAmbientali(Integer id, Integer quantitaCo2, Date dataInizio, Date dataFine, Integer luminosita, double quantitaAps25, double quantitaPm10, String idUtente) {
        this.id = id;
        this.quantitaCo2 = quantitaCo2;
        this.dataInizio = dataInizio;
        this.dataFine = dataFine;
        this.luminosita = luminosita;
        this.quantitaAps25 = quantitaAps25;
        this.quantitaPm10 = quantitaPm10;
        this.idUtente = idUtente;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantitaCo2() {
        return quantitaCo2;
    }
    public void setQuantitaCo2(Integer quantitaCo2) {
        this.quantitaCo2 = quantitaCo2;
    }

    public Date getDataInizio() {
        return dataInizio;
    }
    public void setDataInizio(Date dataInizio) {
        this.dataInizio = dataInizio;
    }

    public Date getDataFine() {
        return dataFine;
    }
    public void setDataFine(Date dataFine) {
        this.dataFine = dataFine;
    }

    public Integer getLuminosita() {
        return luminosita;
    }
    public void setLuminosita(Integer luminosita) {
        this.luminosita = luminosita;
    }

    public double getQuantitaAps25() {
        return quantitaAps25;
    }
    public void setQuantitaAps25(double quantitaAps25) {
        this.quantitaAps25 = quantitaAps25;
    }

    public double getQuantitaPm10() {
        return quantitaPm10;
    }
    public void setQuantitaPm10(double quantitaPm10) {
        this.quantitaPm10 = quantitaPm10;
    }

    public String getIdUtente() {
        return idUtente;
    }
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    @Override
    public String toString() {
        return "ParametriAmbientali{" +
                "id=" + id +
                ", quantitaCo2=" + quantitaCo2 +
                ", dataInizio=" + dataInizio +
                ", dataFine=" + dataFine +
                ", luminosita=" + luminosita +
                ", quantitaAps25=" + quantitaAps25 +
                ", quantitaPm10=" + quantitaPm10 +
                ", idUtente='" + idUtente + '\'' +
                '}';
    }
}
