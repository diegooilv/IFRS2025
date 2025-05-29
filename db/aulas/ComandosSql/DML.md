<!-- ===============================
     🏷️ Data Manipulation Language (DML)
     =============================== -->

# 🏷️ Data Manipulation Language (DML)

> “Manipule os dados com segurança e eficiência.”

---

## 🎯 Objetivos de Aprendizagem

- **Básico**: Identificar comandos principais: `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
- **Intermediário**: Filtrar e ordenar resultados usando `WHERE`, `ORDER BY`, agrupar dados com `GROUP BY` e `HAVING`.
- **Avançado**: Combinar dados com `JOIN`, subconsultas e CTEs; executar operações em lote com transações.

---

## 📖 Introdução & Contexto

A **DML** (Data Manipulation Language) é responsável por **ler** e **modificar** registros em tabelas de banco de dados. No fluxo de trabalho, após a definição da estrutura (DDL), a DML movimenta os dados: consultas, inserções, atualizações e remoções.

> **Caso prático**:
> Em um sistema de biblioteca:
>
> - `INSERT` para cadastrar novos livros
> - `SELECT` para listar títulos disponíveis
> - `UPDATE` para marcar livros como emprestados
> - `DELETE` para remover registros obsoletos

---

## 🔤 Sintaxe Geral & Destaques

```sql
COMANDO tabela
  [colunas]
  [cláusula_condicional]
  [outras_opções];
```

- **COMANDO**: `SELECT`, `INSERT INTO`, `UPDATE`, `DELETE`
- **tabela**: nome da tabela-alvo
- **colunas**: colunas envolvidas (ou `*` para todas)
- **cláusula_condicional**: `WHERE …` para filtrar registros
- **outras_opções**: `ORDER BY`, `GROUP BY`, `HAVING`, `RETURNING`, etc.

---

## 📋 Detalhamento dos Elementos

| Elemento      | Descrição                              | Caso de Uso                        |
| ------------- | -------------------------------------- | ---------------------------------- |
| `SELECT`      | Recupera dados                         | Listar clientes ativos             |
| `INSERT INTO` | Insere novos registros                 | Registrar novo livro               |
| `UPDATE`      | Atualiza registros existentes          | Marcar livro como emprestado       |
| `DELETE`      | Remove registros                       | Excluir livro extraviado           |
| `WHERE`       | Filtra linhas                          | Livros publicados após 2020        |
| `ORDER BY`    | Ordena resultados                      | Exibir títulos em ordem alfabética |
| `GROUP BY`    | Agrupa resultados                      | Total de empréstimos por autor     |
| `HAVING`      | Filtra grupos após `GROUP BY`          | Autores com mais de 50 empréstimos |
| `JOIN`        | Combina linhas de duas ou mais tabelas | Relacionar livros e autores        |

---

## 💡 Exemplos Comentados

### Exemplo Básico (SELECT)

```sql
SELECT id, titulo, autor        -- colunas desejadas
FROM livros                     -- tabela de livros
WHERE disponivel = TRUE         -- apenas disponíveis
ORDER BY titulo;                -- ordena por título
```

### Exemplo de Inserção (INSERT)

```sql
INSERT INTO livros (titulo, autor, ano_publicacao)  -- tabela e colunas
VALUES ('Dom Casmurro', 'Machado de Assis', 1899);  -- valores a inserir
```

### Exemplo de Atualização (UPDATE)

```sql
UPDATE livros
SET disponivel = FALSE         -- marca como indisponível
WHERE id = 42;                 -- livro com id = 42
```

### Exemplo de Remoção (DELETE)

```sql
DELETE FROM reservas
WHERE data_reserva < NOW() - INTERVAL '30 days';  -- remove reservas com mais de 30 dias
```

### Exemplo Avançado (JOIN + CTE)

```sql
WITH total_autores AS (
  SELECT a.id, a.nome, COUNT(*) AS emprestimos
  FROM autores a
  JOIN livros l ON l.autor = a.nome
  JOIN emprestimos e ON e.livro_id = l.id
  GROUP BY a.id, a.nome
  HAVING COUNT(*) > 50          -- filtra autores populares
)
SELECT *                       -- resultados da CTE
FROM total_autores
ORDER BY emprestimos DESC
LIMIT 5;                       -- top 5 autores mais emprestados
```

---

## ⚠️ Dicas e Boas Práticas

- Nunca use `DELETE` sem `WHERE` para evitar apagar todos os registros.
- Use transações (`BEGIN … COMMIT`) ao executar múltiplos comandos relacionados.
- Previna SQL Injection com prepared statements.
- Utilize `RETURNING` em `INSERT`/`UPDATE` para recuperar valores gerados.
- Documente consultas complexas com comentários.

---

## 🧩 Exercícios de Fixação

- Liste todos os livros publicados depois de 2000:

  ```sql
  SELECT * FROM livros
  WHERE ano_publicacao > 2000;
  ```

- Insira um autor com nome “Clarice Lispector” na tabela `autores`.

- Crie uma CTE para calcular o número de reservas por usuário e selecione usuários com mais de 10 reservas:

  ```sql
  WITH reservas_usuario AS (
    SELECT usuario_id, COUNT(*) AS total
    FROM reservas
    GROUP BY usuario_id
  )
  SELECT usuario_id, total
  FROM reservas_usuario
  WHERE total > 10;
  ```

---

## 📚 Referências

- W3Schools — [SQL DML](https://www.w3schools.com/sql/sql_ref_dml.asp)
- PostgreSQL Docs — [SELECT](https://www.postgresql.org/docs/current/sql-select.html)
- Anthony Molinaro, _SQL Cookbook_

---
