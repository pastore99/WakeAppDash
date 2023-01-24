package beans;
import java.sql.Date;

public class Audio {
    private Integer idAudio;
    private String data;
    private Integer durata;
    private String emozioneIa;
    private String emozioneUtente;
    private String idUtente;
    private String idTesto;
    private String path;

    public Audio() {}
    public Audio(Integer idAudio, String data, String emozioneIa, String emozioneUtente, String idUtente, String idTesto) {
        this.idAudio = idAudio;
        this. data = data;
        this.emozioneIa = emozioneIa;
        this.emozioneUtente = emozioneUtente;
        this.idUtente = idUtente;
        this.idTesto = idTesto;
    }

    public Integer getIdAudio() {
        return idAudio;
    }
    public void setIdAudio(Integer idAudio) {
        this.idAudio = idAudio;
    }

    public String getData() {
        return data;
    }
    public void setData(String data) {
        this.data = data;
    }

    public Integer getDurata() {
        return durata;
    }
    public void setDurata(Integer durata) {
        this.durata = durata;
    }

    public String getEmozioneIa() {
        return emozioneIa;
    }
    public void setEmozioneIa(String emozioneIa) {
        this.emozioneIa = emozioneIa;
    }

    public String getEmozioneUtente() {
        return emozioneUtente;
    }
    public void setEmozioneUtente(String emozioneUtente) {
        this.emozioneUtente = emozioneUtente;
    }

    public String getIdUtente() {
        return idUtente;
    }
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public String getIdTesto() {
        return idTesto;
    }
    public void setIdTesto(String idTesto) {
        this.idTesto = idTesto;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String idTesto) {
        this.path = path;
    }
    @Override
    public String toString() {
        return "Audio{" +
                "idAudio=" + idAudio +
                ", data=" + data +
                ", durata=" + durata +
                ", emozioneIa='" + emozioneIa + '\'' +
                ", emozioneUtente='" + emozioneUtente + '\'' +
                ", idUtente='" + idUtente + '\'' +
                ", idTesto='" + idTesto + '\'' +
                '}';
    }
}

