package beans;

public class Emozione {
    private String nome;
    private int valore;

    public Emozione(String nome, int valore) {
        this.nome = nome;
        this.valore = valore;
    }

    public String getNome() {
        return nome;
    }

    public int getValore() {
        return valore;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setValore(int valore) {
        this.valore = valore;
    }
}
