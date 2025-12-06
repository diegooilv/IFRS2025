# 📝 DML - Data Manipulation Language

A **Linguagem de Manipulação de Dados** (DML) é usada para gerenciar os dados dentro das tabelas.

---

## 1. INSERT (Inserir)
Adiciona novos registros.

```sql
INSERT INTO aluno (nome, curso_id) VALUES ('Maria', 1);
```

---

## 2. UPDATE (Atualizar)
Modifica registros existentes.

```sql
UPDATE aluno SET nome = 'Maria Silva' WHERE id = 1;
```
> ⚠️ **Sempre use WHERE!**

---

## 3. DELETE (Excluir)
Remove registros.

```sql
DELETE FROM aluno WHERE id = 1;
```
> ⚠️ **Sempre use WHERE!**

---

## 4. SELECT (Consultar)
Recupera dados. (Tecnicamente DQL - Data Query Language, mas frequentemente agrupado aqui).

```sql
SELECT * FROM aluno WHERE curso_id = 1 ORDER BY nome;
```
