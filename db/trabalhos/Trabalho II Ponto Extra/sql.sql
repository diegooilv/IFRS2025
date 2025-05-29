-- Criação das tabelas
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
    FOREIGN KEY (cod_curso) REFERENCES curso (cod_curso) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (cod_aluno)
);

-- Inserção de cursos
INSERT INTO curso(nom_curso) VALUES ('Administração');
INSERT INTO curso(nom_curso) VALUES ('Informática');
INSERT INTO curso(nom_curso) VALUES ('Agropecuária');
INSERT INTO curso(nom_curso) VALUES ('ADS');
INSERT INTO curso(nom_curso) VALUES ('TPG');
INSERT INTO curso(nom_curso) VALUES ('Comércio');
INSERT INTO curso(nom_curso) VALUES ('Recursos Humanos');

-- Inserção de alunos com curso
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Pedro', 'M', 1);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('João', 'M', 1);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Carlos', 'M', 1);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Vitória', 'F', 1);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Maria', 'F', 2);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Luiza', 'F', 2);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Alex', 'M', 2);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Mauricio', 'M', 2);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Lucas', 'M', 3);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Fabrício', 'M', 3);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Gabriel', 'M', 4);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Marcos', 'M', 4);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Paula', 'F', 5);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Fernanda', 'F', 5);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Manoel', 'M', 6);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Ricardo', 'M', 7);
INSERT INTO aluno(nom_aluno, sexo, cod_curso) VALUES ('Matheus', 'M', 7);

-- Inserção de alunos sem curso
INSERT INTO aluno(nom_aluno, sexo) VALUES ('Cristian', 'M');
INSERT INTO aluno(nom_aluno, sexo) VALUES ('Moisés', 'M');
INSERT INTO aluno(nom_aluno, sexo) VALUES ('Mariana', 'F');
INSERT INTO aluno(nom_aluno, sexo) VALUES ('Juliana', 'F');

-- 1) (Peso 2,0)
-- Alunos que cursam Administração ou TPG com produto cartesiano e ordenação
SELECT a.nom_aluno, c.nom_curso
FROM aluno AS a, curso AS c
WHERE a.cod_curso = c.cod_curso
  AND (c.nom_curso = 'Administração' OR c.nom_curso = 'TPG')
ORDER BY c.nom_curso, a.nom_aluno;

-- 2) (Peso 2,0)
-- Explicação da consulta:
-- SELECT nom_curso, COUNT(*)   -> Seleciona o nome do curso e a contagem de alunos
-- FROM aluno, curso            -> Usa ambas as tabelas
-- WHERE aluno.cod_curso = curso.cod_curso -> Faz o vínculo entre aluno e curso
-- GROUP BY nom_curso           -> Agrupa por nome do curso
-- ORDER BY COUNT(*) DESC;     -> Ordena do maior para o menor número de alunos
SELECT nom_curso, COUNT(*)
FROM aluno, curso
WHERE aluno.cod_curso = curso.cod_curso
GROUP BY nom_curso
ORDER BY COUNT(*) DESC;

-- 3) (Peso 2,0)
-- Alunos sem curso, agrupados por sexo
SELECT a.sexo, COUNT(*)
FROM aluno AS a
WHERE a.cod_curso IS NULL
GROUP BY a.sexo;

-- 4) (Peso 2,0)
-- O comando INSERT é capaz de inserir novos registros em um banco de dados relacional,
-- sendo classificado como um comando do tipo DML.
-- (x) CERTO
-- ( ) ERRADO

-- 5) (Peso 2,0)
-- Em relação às cláusulas utilizadas em consultas SQL, assinale a alternativa CORRETA:
-- a) Uma consulta SQL pode conter apenas 1 (uma) cláusula SQL.
-- b) Para fazer a filtragem, depois dos dados já terem sido agrupados, utiliza-se a cláusula WHERE.
-- c) Para fazer a filtragem, antes dos dados já terem sido agrupados, utiliza-se a cláusula HAVING.
-- d) A cláusula SELECT lista as colunas (campos) de uma consulta.  <- CORRETA
-- e) A cláusula FROM é utilizada para fazer a filtragem em uma consulta.
