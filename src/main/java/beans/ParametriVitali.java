package beans;
import java.util.Date;

public class ParametriVitali {
    private Integer id;
    private Date dataInizio;
    private Date dataFine;
    private String ora;
    private Integer battiti;
    private Double frequenzaRespiratoria;
    private Integer ossigenazione;
    private Integer qualitaSonno;
    private String idUtente;

    public ParametriVitali() { }

    public ParametriVitali(Integer id, Date dataInizio, Date dataFine, String ora, Integer battiti, Double frequenzaRespiratoria, Integer ossigenazione, Integer qualitaSonno, String idUtente) {
        this.id = id;
        this.dataInizio = dataInizio;
        this.dataFine = dataFine;
        this.ora = ora;
        this.battiti = battiti;
        this.frequenzaRespiratoria = frequenzaRespiratoria;
        this.ossigenazione = ossigenazione;
        this.qualitaSonno = qualitaSonno;
        this.idUtente = idUtente;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
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

    public String getOra() {
        return ora;
    }
    public void setOra(String ora) {
        this.ora = ora;
    }

    public Integer getBattiti() {
        return battiti;
    }
    public void setBattiti(Integer battiti) {
        this.battiti = battiti;
    }

    public Double getFrequenzaRespiratoria() {
        return frequenzaRespiratoria;
    }
    public void setFrequenzaRespiratoria(Double frequenzaRespiratoria) {
        this.frequenzaRespiratoria = frequenzaRespiratoria;
    }

    public Integer getOssigenazione() {
        return ossigenazione;
    }
    public void setOssigenazione(Integer ossigenazione) {
        this.ossigenazione = ossigenazione;
    }

    public Integer getQualitaSonno() {
        return qualitaSonno;
    }
    public void setQualitaSonno(Integer qualitaSonno) {
        this.qualitaSonno = qualitaSonno;
    }

    public String getIdUtente() {
        return idUtente;
    }
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    @Override
    public String toString() {
        return "ParametriVitali{" +
                "id=" + id +
                ", dataInizio=" + dataInizio +
                ", dataFine=" + dataFine +
                ", ora='" + ora + '\'' +
                ", battiti=" + battiti +
                ", frequenzaRespiratoria=" + frequenzaRespiratoria +
                ", ossigenazione=" + ossigenazione +
                ", qualitaSonno=" + qualitaSonno +
                ", idUtente='" + idUtente + '\'' +
                '}';
    }
}
