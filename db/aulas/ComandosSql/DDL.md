<!-- ===============================
     🏗️ Data Definition Language (DDL)
     =============================== -->

# 🏗️ Data Definition Language (DDL)

> “Estruture seu banco: crie, modifique e remova objetos com segurança.”

---

## 🎯 Objetivos de Aprendizagem

- **Básico**: Reconhecer comandos principais: `CREATE`, `ALTER`, `DROP`.
- **Intermediário**: Aplicar `IF NOT EXISTS` / `IF EXISTS`; definir e alterar constraints.
- **Avançado**: Gerenciar schemas, views, índices e triggers; entender dependências entre objetos.

---

## 📖 Introdução & Contexto

A **DDL** (Data Definition Language) é a parte do SQL que **define** e **altera** a estrutura dos objetos de banco de dados: tabelas, índices, views, esquemas, etc.  
Antes de inserir ou manipular dados (DML), é preciso estabelecer uma base sólida usando a DDL.

> **Caso prático**:  
> Num sistema de gerenciamento de projetos, usamos DDL para:
>
> - Criar a tabela `projetos` com colunas e tipos adequados
> - Adicionar índices em colunas de busca frequente
> - Modificar a estrutura à medida que requisitos mudam

---

## 🔤 Sintaxe Geral & Destaques

```sql
COMANDO objeto
  [nome_objeto]
  [definições | modificações]
  [opções_adicionais];
```

- **COMANDO**: `CREATE`, `ALTER`, `DROP`
- **objeto**: `TABLE`, `INDEX`, `VIEW`, `SCHEMA`, `SEQUENCE`, etc.
- **nome_objeto**: nome do item-alvo
- **definições / modificações**: colunas, tipos, constraints, cláusulas
- **opções_adicionais**: `IF NOT EXISTS`, `CASCADE`, `RESTRICT`

---

## 📋 Detalhamento dos Elementos

| Elemento               | Descrição                                        | Exemplo de Uso                        |
| ---------------------- | ------------------------------------------------ | ------------------------------------- |
| `CREATE TABLE`         | Cria uma nova tabela                             | Definir estrutura de `usuarios`       |
| `ALTER TABLE`          | Modifica tabela existente (colunas, constraints) | Adicionar coluna `status`             |
| `DROP TABLE`           | Remove tabela                                    | Remover tabela de testes              |
| `CREATE INDEX`         | Cria índice para acelerar consultas              | Índice em `email` de `usuarios`       |
| `CREATE VIEW`          | Define visão lógica sobre uma ou mais tabelas    | View de relatórios                    |
| `CREATE SCHEMA`        | Agrupa objetos em um namespace                   | Separar objetos de diferentes módulos |
| `CASCADE` / `RESTRICT` | Controla remoção dependências                    | `DROP TABLE ... CASCADE`              |

---

## 💡 Exemplos Comentados

### Criação de Tabela

```sql
CREATE TABLE usuarios (               -- define nova tabela
  id SERIAL PRIMARY KEY,              -- chave primária autoincrementável
  nome VARCHAR(100) NOT NULL,         -- nome do usuário
  email VARCHAR(150) UNIQUE,          -- email único
  criado_em TIMESTAMP DEFAULT NOW()   -- timestamp de criação
);
```

### Alteração de Tabela

```sql
ALTER TABLE usuarios
  ADD COLUMN status VARCHAR(20) DEFAULT 'ativo',   -- adiciona coluna
  DROP COLUMN criado_em;                           -- remove coluna
```

### Remoção de Tabela

```sql
DROP TABLE IF EXISTS logs RESTRICT;  -- apaga tabela apenas se existir, sem afetar dependências
```

### Criação de Índice e View

```sql
CREATE INDEX idx_email ON usuarios(email);

CREATE VIEW vw_usuarios_ativos AS
SELECT id, nome, email
FROM usuarios
WHERE status = 'ativo';
```

---

## ⚠️ Dicas e Boas Práticas

- Utilize `IF NOT EXISTS` / `IF EXISTS` para evitar erros em ambientes de implantação contínua.
- Prefira nomes claros e consistentes: _snake_case_ para tabelas e colunas.
- Crie índices apenas em colunas usadas frequentemente em condições de busca.
- Documente objetos complexos com `COMMENT ON`:

  ```sql
  COMMENT ON TABLE usuarios IS 'Armazena dados dos usuários do sistema';
  ```

- Use `CASCADE` com cuidado: pode remover objetos dependentes inadvertidamente.

---

## 🧩 Exercícios de Fixação

- Criar tabela `produtos` com colunas `id`, `nome`, `preco` e `estoque`:

  ```sql
  CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
  );
  ```

- Adicionar constraint de unicidade em `email` na tabela `clientes`:

  ```sql
  ALTER TABLE clientes
  ADD CONSTRAINT uq_email UNIQUE(email);
  ```

- Remover o índice `idx_antigo` se existir:

  ```sql
  DROP INDEX IF EXISTS idx_antigo;
  ```

- Criar view `vw_vendas_mes` para total de vendas no mês atual:

  ```sql
  CREATE VIEW vw_vendas_mes AS
  SELECT cliente_id, SUM(valor) AS total
  FROM vendas
  WHERE data_venda >= date_trunc('month', CURRENT_DATE)
  GROUP BY cliente_id;
  ```

---

## 📚 Referências

- W3Schools — [SQL DDL](https://www.w3schools.com/sql/sql_ref_ddl.asp)
- PostgreSQL Docs — [CREATE TABLE](https://www.postgresql.org/docs/current/sql-createtable.html)
- PostgreSQL Docs — [ALTER TABLE](https://www.postgresql.org/docs/current/sql-altertable.html)

---
