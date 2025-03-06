
public class Professor {

    private String nome;
    private String matricula;
    private String disciplina;
    private String email;
    private String telefone;

    public Professor(String nome, String matricula, String disciplina, String email, String telefone) {
        this.setNome(nome);
        this.setMatricula(matricula);
        this.setDisciplina(disciplina);
        this.setEmail(email);
        this.setTelefone(telefone);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public void setEmail(String email) {
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new IllegalArgumentException("Email inválido!");
        }
        this.email = email;
    }

    public void setTelefone(String telefone) {
        if (!telefone.matches("^\\(\\d{2}\\)\\d{4,5}-\\d{4}$")) {
            throw new IllegalArgumentException("Telefone inválido!");
        }
        this.telefone = telefone;
    }

    public String getNome() {
        return this.nome;
    }

    public String getMatricula() {
        return this.matricula;
    }

    public String getDisciplina() {
        return this.disciplina;
    }

    public String getEmail() {
        return this.email;
    }

    public String getTelefone() {
        return this.telefone;
    }
}
