# Instituto Federal de Educação, Ciência e Tecnologia do Rio Grande do Sul

**Campus Rolante**

## Curso Técnico em Informática Integrado ao Ensino Médio

**Complemento de Nota - 1º Trimestre – Banco de Dados II – INFO 3 - 2025**

> Este trabalho, válido como complemento de nota, pode ser realizado em grupos de até 4 membros.  
> **Valor:** 1,0 ponto na média final da nota de BD2 do 1º Trimestre.  
> **Data de Entrega:** Em mãos na aula de BD2 do dia 05/06/2025.  
> **Prof.:** Gabriel Marchesan

---

### Base de Dados Exemplo

```sql
CREATE TABLE curso (
    cod_curso SERIAL NOT NULL,
    nom_curso VARCHAR(50),
    PRIMARY KEY (cod_curso)
);

CREATE TABLE aluno (
    cod_aluno SERIAL NOT NULL,
    nom_aluno VARCHAR(50),
    sexo CHAR(1),
    cod_curso INT,
    FOREIGN KEY (cod_curso) REFERENCES curso (cod_curso)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (cod_aluno)
);

INSERT INTO curso(nom_curso) VALUES ('Administração');
INSERT INTO curso(nom_curso) VALUES ('Informática');
INSERT INTO curso(nom_curso) VALUES ('Agropecuária');
INSERT INTO curso(nom_curso) VALUES ('ADS');
INSERT INTO curso(nom_curso) VALUES ('TPG');
INSERT INTO curso(nom_curso) VALUES ('Comércio');
INSERT INTO curso(nom_curso) VALUES ('Recursos Humanos');

INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES
('Pedro', 'M', 1),
('João', 'M', 1),
('Carlos', 'M', 1),
('Vitória', 'F', 1),
('Maria', 'F', 2),
('Luiza', 'F', 2),
('Alex', 'M', 2),
('Mauricio', 'M', 2),
('Lucas', 'M', 3),
('Fabrício', 'M', 3),
('Gabriel', 'M', 4),
('Marcos', 'M', 4),
('Paula', 'F', 5),
('Fernanda', 'F', 5),
('Manoel', 'M', 6),
('Ricardo', 'M', 7),
('Matheus', 'M', 7);

INSERT INTO aluno(nom_aluno, sexo) VALUES
('Cristian', 'M'),
('Moisés', 'M'),
('Mariana', 'F'),
('Juliana', 'F');
```

---

### Atividades

**1) (Peso 2,0)**
Retornar os nomes dos alunos e o nome do curso dos alunos que cursam **Administração** ou **TPG**, buscando pelo nome do curso, usando **produto cartesiano** (cruzamento entre PK e FK), ordenando o resultado em ordem crescente pelo nome do curso e nome do aluno, respectivamente.

---

**2) (Peso 2,0)**
Explique detalhadamente o que faz a consulta SQL a seguir:

```sql
SELECT nom_curso, COUNT(*)
FROM aluno, curso
WHERE aluno.cod_curso = curso.cod_curso
GROUP BY nom_curso
ORDER BY COUNT(*) DESC;
```

---

**3) (Peso 2,0)**
Retornar o sexo e a quantidade de alunos de cada sexo dos alunos que **NÃO estão cursando algum curso** no momento.

---

**4) (Peso 2,0)**
Acerca da Linguagem de Consulta Estruturada (SQL), usada para fazer a manipulação e a definição de dados em sistemas gerenciadores de banco de dados, julgue o item subsequente, assinalando CERTO ou ERRADO, justificando neste último caso:

> O comando `INSERT` é capaz de inserir novos registros em um banco de dados relacional, sendo classificado como um comando do tipo DML.

- ( ) CERTO
- ( ) ERRADO

---

**5) (Peso 2,0)**
Em relação às cláusulas ou blocos utilizados para fazer uma consulta (query) utilizando-se a Linguagem de Consulta Estruturada (SQL) no SGBD PostgreSQL, assinale a alternativa **CORRETA**:

a) Uma consulta SQL pode conter apenas 1 (uma) cláusula SQL.
b) Para fazer a filtragem, depois dos dados já terem sido agrupados, utiliza-se a cláusula WHERE.
c) Para fazer a filtragem, antes dos dados já terem sido agrupados, utiliza-se a cláusula HAVING.
d) A cláusula SELECT lista as colunas (campos) de uma consulta.
e) A cláusula FROM é utilizada para fazer a filtragem em uma consulta.

---

**Bom Complemento de Nota – 1º Trimestre - BD2 – INFO 3 – 2025!**
---

> Respostas estão [aqui!](sql.sql)