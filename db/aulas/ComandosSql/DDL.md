# 🏗️ DDL - Data Definition Language

A **Linguagem de Definição de Dados** (DDL) é responsável por definir a estrutura do banco de dados (esquema).

---

## 1. CREATE (Criar)
Cria novos objetos (bancos, tabelas, índices, views).

### 1.1. Banco de Dados
```sql
CREATE DATABASE ifrs2025;
```

### 1.2. Tabela
```sql
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);
```

---

## 2. ALTER (Alterar)
Modifica a estrutura de objetos existentes.

### 2.1. Adicionar Coluna
```sql
ALTER TABLE aluno ADD COLUMN email VARCHAR(150);
```

### 2.2. Adicionar Restrição
```sql
ALTER TABLE aluno ADD CONSTRAINT uq_email UNIQUE (email);
```

---

## 3. DROP (Remover)
Remove objetos do banco de dados. **Irreversível**.

```sql
DROP TABLE aluno;
DROP DATABASE ifrs2025;
```

---

## 4. TRUNCATE (Limpar)
Remove **todos** os dados de uma tabela, mas mantém a estrutura. É mais rápido que o DELETE sem WHERE e reseta contadores de identidade (em alguns SGBDs).

```sql
TRUNCATE TABLE aluno;
```
