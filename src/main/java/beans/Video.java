package beans;
import java.util.Date;

public class Video {
    private Integer idVideo;
    private Date data;
    private Integer durata;
    private  String emozioneIa;
    private String emozioneUtente;
    private String ora;
    private String idUtente;
    private String path;

    public Video() {}
    public Video(Integer idVideo, Date data, Integer durata, String emozioneIa, String emozioneUtente, String ora, String idUtente) {
        this.idVideo = idVideo;
        this.data = data;
        this.durata = durata;
        this.emozioneIa = emozioneIa;
        this.emozioneUtente = emozioneUtente;
        this.ora = ora;
        this.idUtente = idUtente;
    }

    public Integer getIdVideo() {
        return idVideo;
    }
    public void setIdVideo(Integer idVideo) {
        this.idVideo = idVideo;
    }

    public Date getData() {
        return data;
    }
    public void setData(Date data) {
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

    public String getOra() {
        return ora;
    }
    public void setOra(String ora) {
        this.ora = ora;
    }

    public String getIdUtente() {
        return idUtente;
    }
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Video{" +
                "idVideo=" + idVideo +
                ", data=" + data +
                ", durata=" + durata +
                ", emozioneIa='" + emozioneIa + '\'' +
                ", emozioneUtente='" + emozioneUtente + '\'' +
                ", ora='" + ora + '\'' +
                ", idUtente='" + idUtente + '\'' +
                '}';
    }
}
