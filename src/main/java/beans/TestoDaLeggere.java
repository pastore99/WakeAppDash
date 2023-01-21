package beans;
public class TestoDaLeggere {
    private String id;
    private String testo;

    public TestoDaLeggere() {}
    public TestoDaLeggere(String id, String testo) {
        this.id = id;
        this.testo = testo;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getTesto() {
        return testo;
    }
    public void setTesto(String testo) {
        this.testo = testo;
    }

    @Override
    public String toString() {
        return "TestoDaLeggere{" +
                "id='" + id + '\'' +
                ", testo='" + testo + '\'' +
                '}';
    }
}
