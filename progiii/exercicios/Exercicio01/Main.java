
public class Main {

    public static void main(String[] args) {
        try {
            // --- Testando Escola ---
            Escola escola = new Escola("Escola Exemplo", "04.252.011/0001-10", "Rua das Flores, 123", "(12)3456-7890", "contato@escola.com");

            System.out.println("=== Escola ===");
            System.out.println("Nome: " + escola.getNome());
            System.out.println("CNPJ: " + escola.getCnpj());
            System.out.println("Endereço: " + escola.getEndereco());
            System.out.println("Telefone: " + escola.getTelefone());
            System.out.println("Email: " + escola.getEmail());
            System.out.println();

            // --- Testando Professor ---
            Professor professor = new Professor("João da Silva", "PROF123", "Matemática", "joao.silva@escola.com", "(11)98765-4321");

            System.out.println("=== Professor ===");
            System.out.println("Nome: " + professor.getNome());
            System.out.println("Matrícula: " + professor.getMatricula());
            System.out.println("Disciplina: " + professor.getDisciplina());
            System.out.println("Email: " + professor.getEmail());
            System.out.println("Telefone: " + professor.getTelefone());
            System.out.println();

            // --- Testando Materias ---
            Materias materia = new Materias("Matemática", "Introdução à álgebra e geometria.", 60, professor);

            System.out.println("=== Matéria ===");
            System.out.println("Nome: " + materia.getNome());
            System.out.println("Ementa: " + materia.getEmenta());
            System.out.println("Carga Horária: " + materia.getCargaHoraria());
            System.out.println("Professor: " + materia.getProfessor().getNome());
            System.out.println();

            // --- Testando Aluno ---
            Aluno aluno = new Aluno("Maria Oliveira", "111.444.777-35", 12345, "maria.oliveira@escola.com", "(21)12345-6789");

            System.out.println("=== Aluno ===");
            System.out.println("Nome: " + aluno.getNome());
            System.out.println("CPF: " + aluno.getCpf());
            System.out.println("Matrícula: " + aluno.getMatricula());
            System.out.println("Email: " + aluno.getEmail());
            System.out.println("Telefone: " + aluno.getTelefone());
            System.out.println();

            // --- Testando Turma ---
            Aluno[] alunos = {aluno};
            Professor[] professores = {professor};
            Materias[] materias = {materia};
            Turma turma = new Turma(1, alunos, professores, materias, 101);

            System.out.println("=== Turma ===");
            System.out.println("Número: " + turma.getNumero());
            System.out.println("Número da sala: " + turma.getNumeroSala());
            System.out.println("Alunos: " + (turma.getAlunos() == null ? "null" : "definido"));
            System.out.println("Professores: " + (turma.getProfessores() == null ? "null" : "definido"));
            System.out.println("Matérias: " + (turma.getMaterias() == null ? "null" : "definido"));

        } catch (IllegalArgumentException e) {
            System.err.println("Erro: " + e.getMessage());
        }
    }
}
