# Exercícios do Dia 28/02

## Classe Aluno

```java
public class Aluno {
    int id;
    String nome;
    String email;
    String cpf;
    String endereco;

    public Aluno(int id, String nome, String email, String cpf, String endereco){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.endereco = endereco;
    }

    public void set id, nome, email, cpf, endereco
    public int get id
    public String get nome, email, cpf, endereco
}
```

## Classe Professor

```java
public class Professor {
    int id;
    String nome;
    String email;
    String cpf;
    String endereco;

    public Professor(int id, String nome, String email, String cpf, String endereco){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.endereco = endereco;
    }

    public void set id, nome, email, cpf, endereco
    public int get id
    public String get nome, email, cpf, endereco
}
```

## Classe Escola

```java
public class Escola {
    int id;
    String nome;
    String email;
    String cnpj;
    String endereco;

    public Escola(int id, String nome, String email, String cnpj, String endereco){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cnpj = cnpj;
        this.endereco = endereco;
    }

    public void set id, nome, email, cnpj, endereco
    public int get id
    public String get nome, email, cnpj, endereco
}
```

## Classe Turma

```java
public class Turma {
    int id;
    String nome;
    String serie;
    String turno;
    String sala;

    public Turma(int id, String nome, String serie, String turno, String sala){
        this.id = id;
        this.nome = nome;
        this.serie = serie;
        this.turno = turno;
        this.sala = sala;
    }

    public void set id, nome, serie, turno, sala
    public int get id
    public String get nome, serie, turno, sala
}

```

## Classe Materia

```java
public class Materia {
    int id;
    String nome;
    String descricao;
    String cargaHoraria;
    String professor;

    public Materia(int id, String nome, String descricao, String cargaHoraria, String professor){
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.cargaHoraria = cargaHoraria;
        this.professor = professor;
    }

    public void set id, nome, descricao, cargaHoraria, professor
    public int get id
    public String get nome, descricao, cargaHoraria, professor
}
```

## Classe Teste

```java
public class Teste {
    public static void main(String[] args){
        Aluno aluno = new Aluno(1, "Manoel", "manoel@gmail.com", "123.432.231-87", "Rua sem Saida");
        Professor professor = new Professor(2, "Professor", "professor@gmail.com", "987.654.321-00", "Endereco Professor");
        Escola escola = new Escola(3, "Escola", "escola@gmail.com", "12.345.678/0001-00", "Endereco Escola");
        Turma turma = new Turma(4, "Turma", "Serie 1", "Manha", "Sala 101");
        Materia materia = new Materia(5, "Matematica", "Aritmetica e Algebra", "60h", "Professor");
    }
}
```

> A implementação dos métodos de acesso (getters e setters) foi apresentada de forma simplificada, com o objetivo de evidenciar a estrutura básica.
