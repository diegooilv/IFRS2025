# 👁️ Unidade 6: Visões (Views)

## 1. O que é uma View?
Uma View é uma **tabela virtual** baseada no resultado de uma consulta SQL. Ela não armazena dados fisicamente (exceto Materialized Views), apenas a definição da consulta.

### 1.1. Vantagens
- **Simplificação:** Esconde queries complexas (joins gigantes) sob um nome simples.
- **Segurança:** Pode restringir o acesso a colunas específicas (ex: esconder salários).
- **Abstração:** Permite alterar a estrutura das tabelas sem quebrar aplicações antigas (basta ajustar a view).

---

## 2. Criando e Usando Views

### 2.1. Criação
```sql
CREATE OR REPLACE VIEW vw_alunos_ativos AS
SELECT a.id, a.nome, c.nome AS curso, a.email
FROM aluno a
JOIN curso c ON a.curso_id = c.id
WHERE a.ativo = TRUE;
```

### 2.2. Consulta
Usa-se como se fosse uma tabela normal.
```sql
SELECT * FROM vw_alunos_ativos WHERE curso = 'Informática';
```

### 2.3. Check Option
Garante que inserções/atualizações feitas através da view respeitem o filtro `WHERE` da view.
```sql
CREATE VIEW vw_jovens AS
SELECT * FROM aluno WHERE idade < 18
WITH LOCAL CHECK OPTION;
```

---

## 3. Gerenciamento

### 3.1. Alteração
Geralmente usa-se `CREATE OR REPLACE VIEW`.

### 3.2. Exclusão
```sql
DROP VIEW IF EXISTS vw_alunos_ativos;
```
