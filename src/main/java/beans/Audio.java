package beans;
import java.io.Serializable;
import java.sql.Date;

public class Audio implements Serializable {
    private String idaudio;
    private String data;
    private long durata;
    private String emozioneia;
    private String emozioneutente;
    private String idutente;
    private String idtesto;
    private String path;

    public Audio() {}

    public Audio(String idaudio, String data, long durata, String emozioneia, String emozioneutente, String idutente, String idtesto, String path) {
        this.idaudio = idaudio;
        this.data = data;
        this.durata = durata;
        this.emozioneia = emozioneia;
        this.emozioneutente = emozioneutente;
        this.idutente = idutente;
        this.idtesto = idtesto;
        this.path = path;
    }

    public String getIdaudio() {
        return idaudio;
    }

    public void setIdaudio(String idaudio) {
        this.idaudio = idaudio;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public long getDurata() {
        return durata;
    }

    public void setDurata(long durata) {
        this.durata = durata;
    }

    public String getEmozioneia() {
        return emozioneia;
    }

    public void setEmozioneia(String emozioneia) {
        this.emozioneia = emozioneia;
    }

    public String getEmozioneutente() {
        return emozioneutente;
    }

    public void setEmozioneutente(String emozioneutente) {
        this.emozioneutente = emozioneutente;
    }

    public String getIdutente() {
        return idutente;
    }

    public void setIdutente(String idutente) {
        this.idutente = idutente;
    }

    public String getIdtesto() {
        return idtesto;
    }

    public void setIdtesto(String idtesto) {
        this.idtesto = idtesto;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Audio{" +
                "idAudio=" + idaudio +
                ", data=" + data +
                ", durata=" + durata +
                ", emozioneIa='" + emozioneia + '\'' +
                ", emozioneUtente='" + emozioneutente + '\'' +
                ", idUtente='" + idutente + '\'' +
                ", idTesto='" + idtesto + '\'' +
                '}';
    }
}

