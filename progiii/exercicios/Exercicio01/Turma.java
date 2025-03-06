
public class Turma {

    private int numero;
    private Aluno[] alunos;
    private Professor[] professores;
    private Materias[] materias;
    private int numeroSala;

    public Turma(int numero, Aluno[] alunos, Professor[] professores, Materias[] materias, int numeroSala) {
        this.setNumero(numero);
        this.serAlunos(alunos);
        this.setProfessores(professores);
        this.setMaterias(materias);
        this.setNumeroSala(numeroSala);
    }

    public void setNumero(int numero) {
        if (numero < 0) {
            throw new IllegalArgumentException("Número de turma inválido!");
        }
        this.numero = numero;
    }

    private void serAlunos(Aluno[] alunos) {
        this.alunos = alunos;
    }

    private void setProfessores(Professor[] professores) {
        this.professores = professores;
    }

    private void setMaterias(Materias[] materias) {
        this.materias = materias;
    }

    public void setNumeroSala(int numeroSala) {
        if (numeroSala < 0) {
            throw new IllegalArgumentException("Número de sala inválido!");
        }
        this.numeroSala = numeroSala;
    }

    public int getNumero() {
        return this.numero;
    }

    public Aluno[] getAlunos() {
        return this.alunos;
    }

    public Professor[] getProfessores() {
        return this.professores;
    }

    public Materias[] getMaterias() {
        return this.materias;
    }

    public int getNumeroSala() {
        return this.numeroSala;
    }
}
