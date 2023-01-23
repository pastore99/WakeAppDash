package beans;
import java.sql.Date;

public class Utente {
    private String idUtente;
    private String codiceFiscale;
    private String email;
    private String telefono;
    private String nome;
    private String cognome;
    private String dataDiNascita;
    private String residenza;
    private String password;
    private Integer tipo;
    private String key;

    public Utente() {}
    public Utente(String idUtente, String codiceFiscale, String email, String telefono, String nome, String cognome, String dataDiNascita, String residenza, String password, Integer tipo, String key) {
        this.idUtente = idUtente;
        this.codiceFiscale = codiceFiscale;
        this.email = email;
        this.telefono = telefono;
        this.nome = nome;
        this.cognome = cognome;
        this.dataDiNascita = dataDiNascita;
        this.residenza = residenza;
        this.password = password;
        this.tipo = tipo;
        this.key = key;
    }

    public String getIdUtente() {
        return idUtente;
    }
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public String getCodiceFiscale() {
        return codiceFiscale;
    }
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getDataDiNascita() {
        return dataDiNascita;
    }
    public void setDataDiNascita(String dataDiNascita) {
        this.dataDiNascita = dataDiNascita;
    }

    public String getResidenza() {
        return residenza;
    }
    public void setResidenza(String residenza) {
        this.residenza = residenza;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTipo() {
        return tipo;
    }
    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String toString() {
        return "Utente{" +
                "idUtente='" + idUtente + '\'' +
                ", codiceFiscale='" + codiceFiscale + '\'' +
                ", email='" + email + '\'' +
                ", telefono='" + telefono + '\'' +
                ", nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", dataDiNascita=" + dataDiNascita +
                ", residenza='" + residenza + '\'' +
                ", password='" + password + '\'' +
                ", tipo=" + tipo +
                ", key='" + key + '\'' +
                '}';
    }
}
