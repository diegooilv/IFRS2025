```java
public class Aluno {
    private int id;
    private String nome;
    private String cpf;
    private int matricula;
    private String email;

    public Aluno(int id, String nome, String cpf, int matricula, String email) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.matricula = matricula;
        this.email = email;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getMatricula() {
        return matricula;
    }
    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}
```

---

```java
public class Professor {
    private int id;
    private String nome;
    private String matricula;
    private String disciplina;
    private String email;

    public Professor(int id, String nome, String matricula, String disciplina, String email) {
        this.id = id;
        this.nome = nome;
        this.matricula = matricula;
        this.disciplina = disciplina;
        this.email = email;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getDisciplina() {
        return disciplina;
    }
    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}
```

---

```java
public class Escola {
    private int id;
    private String nome;
    private String cnpj;
    private String endereco;
    private String telefone;

    public Escola(int id, String nome, String cnpj, String endereco, String telefone) {
        this.id = id;
        this.nome = nome;
        this.cnpj = cnpj;
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnpj() {
        return cnpj;
    }
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEndereco() {
        return endereco;
    }
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
```

---

```java
public class Turma {
    private int id;
    private int numero;
    private Aluno[] alunos;
    private Professor[] professores;
    private Materias[] materias;

    public Turma(int id, int numero, Aluno[] alunos, Professor[] professores, Materias[] materias) {
        this.id = id;
        this.numero = numero;
        this.alunos = alunos;
        this.professores = professores;
        this.materias = materias;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getNumero() {
        return numero;
    }
    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Aluno[] getAlunos() {
        return alunos;
    }
    public void setAlunos(Aluno[] alunos) {
        this.alunos = alunos;
    }

    public Professor[] getProfessores() {
        return professores;
    }
    public void setProfessores(Professor[] professores) {
        this.professores = professores;
    }

    public Materias[] getMaterias() {
        return materias;
    }
    public void setMaterias(Materias[] materias) {
        this.materias = materias;
    }
}
```

---

```java
public class Materias {
    private int id;
    private String nome;
    private String ementa;
    private int cargaHoraria;
    private Professor professor;

    public Materias(int id, String nome, String ementa, int cargaHoraria, Professor professor) {
        this.id = id;
        this.nome = nome;
        this.ementa = ementa;
        this.cargaHoraria = cargaHoraria;
        this.professor = professor;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }
    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCargaHoraria() {
        return cargaHoraria;
    }
    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public Professor getProfessor() {
        return professor;
    }
    public void setProfessor(Professor professor) {
        this.professor = professor;
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        // Criando um objeto Aluno
        Aluno aluno1 = new Aluno(1, "João Silva", "12345678901", 1001, "joao.silva@example.com");

        // Criando um objeto Professor
        Professor professor1 = new Professor(1, "Maria Oliveira", "P001", "Matemática", "maria.oliveira@example.com");

        // Criando um objeto Escola
        Escola escola1 = new Escola(1, "Escola ABC", "12345678000199", "Rua das Flores, 123", "(12)3456-7890");

        // Criando um objeto Materias
        Materias materia1 = new Materias(1, "Matemática", "Estudo dos números e operações", 60, professor1);

        // Criando arrays para instanciar a Turma
        Aluno[] alunos = { aluno1 };
        Professor[] professores = { professor1 };
        Materias[] materias = { materia1 };

        // Criando um objeto Turma
        Turma turma1 = new Turma(1, 101, alunos, professores, materias);

        // Exibindo os dados dos objetos criados
        System.out.println("Dados do Aluno:");
        System.out.println("ID: " + aluno1.getId());
        System.out.println("Nome: " + aluno1.getNome());
        System.out.println("CPF: " + aluno1.getCpf());
        System.out.println("Matrícula: " + aluno1.getMatricula());
        System.out.println("Email: " + aluno1.getEmail());
        System.out.println();

        System.out.println("Dados do Professor:");
        System.out.println("ID: " + professor1.getId());
        System.out.println("Nome: " + professor1.getNome());
        System.out.println("Matrícula: " + professor1.getMatricula());
        System.out.println("Disciplina: " + professor1.getDisciplina());
        System.out.println("Email: " + professor1.getEmail());
        System.out.println();

        System.out.println("Dados da Escola:");
        System.out.println("ID: " + escola1.getId());
        System.out.println("Nome: " + escola1.getNome());
        System.out.println("CNPJ: " + escola1.getCnpj());
        System.out.println("Endereço: " + escola1.getEndereco());
        System.out.println("Telefone: " + escola1.getTelefone());
        System.out.println();

        System.out.println("Dados da Matéria:");
        System.out.println("ID: " + materia1.getId());
        System.out.println("Nome: " + materia1.getNome());
        System.out.println("Ementa: " + materia1.getEmenta());
        System.out.println("Carga Horária: " + materia1.getCargaHoraria() + " horas");
        System.out.println("Professor: " + materia1.getProfessor().getNome());
        System.out.println();

        System.out.println("Dados da Turma:");
        System.out.println("ID: " + turma1.getId());
        System.out.println("Número da Turma: " + turma1.getNumero());
        System.out.println("Número de Alunos: " + turma1.getAlunos().length);
        System.out.println("Número de Professores: " + turma1.getProfessores().length);
        System.out.println("Número de Matérias: " + turma1.getMaterias().length);
    }
}
```
