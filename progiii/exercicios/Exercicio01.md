### Como criar uma classe com métodos getters, setters e construtor.
No caderno, elabore 5 classes, cada uma contendo 4 ou 5 atributos.

**Exemplos de Classes:**
- Aluno
- Professor
- Escola
- Turma
- Matéria (Matérias)

## Teste 🚀  
Baixe a pasta [Exercicio 01](Exercicio01/) e execute o arquivo [Main.java](Exercicio01/Main.java).  

# Resolução:
```java
public class Aluno {

    private String nome;
    private String cpf;
    private int matricula;
    private String email;
    private String telefone;

    public Aluno(String nome, String cpf, int matricula, String email, String telefone) {
        this.setNome(nome);
        this.setCpf(cpf);
        this.setMatricula(matricula);
        this.setEmail(email);
        this.setTelefone(telefone);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCpf(String cpf) {

        String cpfDigits = cpf.replaceAll("\\D", "");

        if (cpfDigits.length() != 11 || cpfDigits.matches("(\\d)\\1{10}")) {
            throw new IllegalArgumentException("CPF inválido!");
        }

        int soma = 0;
        for (int i = 0; i < 9; i++) {
            soma += Character.getNumericValue(cpfDigits.charAt(i)) * (10 - i);
        }
        int primeiroDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);
        if (primeiroDigito != Character.getNumericValue(cpfDigits.charAt(9))) {
            throw new IllegalArgumentException("CPF inválido!");
        }

        soma = 0;
        for (int i = 0; i < 10; i++) {
            soma += Character.getNumericValue(cpfDigits.charAt(i)) * (11 - i);
        }
        int segundoDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);
        if (segundoDigito != Character.getNumericValue(cpfDigits.charAt(10))) {
            throw new IllegalArgumentException("CPF inválido!");
        }

        this.cpf = cpfDigits;
    }

    public void setMatricula(int matricula) {
        if (matricula < 0) {
            throw new IllegalArgumentException("Matrícula inválida!");
        }
        this.matricula = matricula;
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

    public String getCpf() {
        return this.cpf;
    }

    public int getMatricula() {
        return this.matricula;
    }

    public String getEmail() {
        return this.email;
    }

    public String getTelefone() {
        return this.telefone;
    }

}
```
---

```java

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
```
---

```java

public class Escola {

    private String nome;
    private String cnpj;
    private String endereco;
    private String telefone;
    private String email;

    public Escola(String nome, String cnpj, String endereco, String telefone, String email) {
        this.setNome(nome);
        this.setCnpj(cnpj);
        this.setEndereco(endereco);
        this.setTelefone(telefone);
        this.setEmail(email);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCnpj(String cnpj) {
        String cnpjDigits = cnpj.replaceAll("\\D", "");

        if (cnpjDigits.length() != 14 || cnpjDigits.matches("(\\d)\\1{13}")) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        int soma = 0;
        int[] pesosPrimeiro = {5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        for (int i = 0; i < 12; i++) {
            soma += Character.getNumericValue(cnpjDigits.charAt(i)) * pesosPrimeiro[i];
        }
        int resto = soma % 11;
        int primeiroDigito = (resto < 2) ? 0 : 11 - resto;
        if (primeiroDigito != Character.getNumericValue(cnpjDigits.charAt(12))) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        soma = 0;
        int[] pesosSegundo = {6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        for (int i = 0; i < 13; i++) {
            soma += Character.getNumericValue(cnpjDigits.charAt(i)) * pesosSegundo[i];
        }
        resto = soma % 11;
        int segundoDigito = (resto < 2) ? 0 : 11 - resto;
        if (segundoDigito != Character.getNumericValue(cnpjDigits.charAt(13))) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        this.cnpj = cnpjDigits;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setTelefone(String telefone) {
        if (!telefone.matches("^\\(\\d{2}\\)\\d{4,5}-\\d{4}$")) {
            throw new IllegalArgumentException("Telefone inválido!");
        }
        this.telefone = telefone;
    }

    public void setEmail(String email) {
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new IllegalArgumentException("Email inválido!");
        }
        this.email = email;
    }

    public String getNome() {
        return this.nome;
    }

    public String getCnpj() {
        return this.cnpj;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public String getTelefone() {
        return this.telefone;
    }

    public String getEmail() {
        return this.email;
    }

}
```
---

```java

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
```
---

```java

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
```

**Nota:** Essa resolução do exercício não leva em conta o requisito de "Possuir um Atributo ID".  
Com essa consideração, veja em [Exercício 01](Exercicio01v2.md)