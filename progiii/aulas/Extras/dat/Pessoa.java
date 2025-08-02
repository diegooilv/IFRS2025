
import java.io.Serializable;

// Classe normal, a única diferença é o "implements Serializable" e a variável "serialVersionUID".
public class Pessoa implements Serializable {

    private static final long serialVersionUID = 1L;
    private String nome;
    private int idade;

    public Pessoa(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    @Override
    public String toString() {
        return nome + " (" + idade + ")";
    }
}
