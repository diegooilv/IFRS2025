
public class Materias {

    private String nome;
    private String ementa;
    private int cargaHoraria;
    private Professor professor;

    public Materias(String nome, String ementa, int cargaHoraria, Professor professor) {
        this.setNome(nome);
        this.setEmenta(ementa);
        this.setCargaHoraria(cargaHoraria);
        this.setProfessor(professor);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    public String getNome() {
        return this.nome;
    }

    public String getEmenta() {
        return this.ementa;
    }

    public int getCargaHoraria() {
        return this.cargaHoraria;
    }

    public Professor getProfessor() {
        return this.professor;
    }
}
