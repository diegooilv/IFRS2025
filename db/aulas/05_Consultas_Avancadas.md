# 🚀 Unidade 5: Consultas SQL Avançadas

## 1. Junções (JOINS)

Permitem combinar dados de duas ou mais tabelas baseadas em uma coluna comum (geralmente PK e FK).

### 1.1. INNER JOIN
Retorna apenas as linhas que têm correspondência em **ambas** as tabelas.

```sql
SELECT a.nome AS aluno, c.nome AS curso
FROM aluno a
INNER JOIN curso c ON a.curso_id = c.id;
```

### 1.2. LEFT JOIN
Retorna todas as linhas da tabela da **esquerda** (primeira), e os dados correspondentes da direita. Se não houver correspondência, retorna NULL na direita.

```sql
-- Alunos e seus cursos (mesmo que o aluno não tenha curso)
SELECT a.nome, c.nome
FROM aluno a
LEFT JOIN curso c ON a.curso_id = c.id;
```

### 1.3. RIGHT JOIN
O inverso do LEFT JOIN. Retorna tudo da direita.

### 1.4. FULL OUTER JOIN
Retorna tudo de ambas, preenchendo com NULL onde não houver correspondência.

### 1.5. CROSS JOIN
Produto cartesiano. Combina cada linha de uma tabela com todas as linhas da outra.

---

## 2. Subconsultas (Subqueries)

Uma consulta dentro de outra.

### 2.1. Subconsulta Independente
Executa uma vez e o resultado é usado na consulta externa.

```sql
-- Alunos que estão em cursos EAD
SELECT nome
FROM aluno
WHERE curso_id IN (
    SELECT id FROM curso WHERE modalidade = 'EAD'
);
```

### 2.2. Subconsulta Correlacionada
Executa uma vez para **cada linha** da consulta externa. É mais lenta.

```sql
-- Alunos e o total de matrículas que eles possuem
SELECT nome,
       (SELECT COUNT(*) FROM matricula m WHERE m.aluno_id = a.id) AS total
FROM aluno a;
```

---

## 3. Operações de Conjunto

### 3.1. UNION
Combina resultados de dois SELECTs, **removendo duplicatas**. As colunas devem ser compatíveis.

```sql
SELECT nome FROM aluno
UNION
SELECT nome FROM professor;
```

### 3.2. UNION ALL
Combina resultados **mantendo duplicatas**. Mais rápido que o UNION.

### 3.3. INTERSECT
Retorna apenas as linhas que aparecem em **ambos** os resultados.

### 3.4. EXCEPT (ou MINUS)
Retorna linhas do primeiro SELECT que **não** estão no segundo.
