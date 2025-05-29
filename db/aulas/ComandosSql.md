# 💻 Comandos SQL

Este guia apresenta as quatro “linguagens” do SQL de forma clara e prática: DDL, DML, DCL e TCL. Cada seção traz:

- 🎯 **Objetivos** – o que você vai aprender
- 📖 **Contexto** – quando e por que usar
- 🔤 **Sintaxe & Destaques** – estrutura genérica
- 💡 **Exemplos Comentados** – passo a passo no código
- ⚠️ **Dicas & Boas Práticas** – cuidados essenciais

---

## 🏗️ Data Definition Language (DDL)

🎯 **Objetivos**

- Entender como criar, alterar e apagar objetos de banco.
- Aplicar `IF NOT EXISTS` / `IF EXISTS` para evitar erros.

📖 **Contexto**  
Define a **estrutura**: tabelas, índices, views, schemas…

> Caso prático: montar a base de um sistema de clientes.

🔤 **Sintaxe & Destaques**

```sql
COMANDO objeto
  nome_objeto
  [definições | modificações]
  [opções_adicionais];
```

- **COMANDO**: `CREATE` / `ALTER` / `DROP` / `TRUNCATE`
- **objeto**: `TABLE`, `INDEX`, `VIEW`, etc.
- **opções_adicionais**: `IF NOT EXISTS`, `CASCADE`, `RESTRICT`

💡 **Exemplos Comentados**

```sql
-- Criação de tabela “clientes”
CREATE TABLE IF NOT EXISTS clientes (
  id SERIAL PRIMARY KEY,                 -- chave única
  nome VARCHAR(100) NOT NULL,            -- não nulo
  email VARCHAR(100) UNIQUE              -- único
);

-- Adiciona coluna telefone
ALTER TABLE clientes
  ADD COLUMN telefone VARCHAR(20);

-- Remove todos os registros, mantém estrutura
TRUNCATE TABLE clientes;

-- Apaga tabela (e objetos dependentes)
DROP TABLE IF EXISTS clientes CASCADE;
```

⚠️ **Dicas & Boas Práticas**

- Use `IF NOT EXISTS` / `IF EXISTS` em scripts de implantação.
- Prefira `_snake_case_` e nomes significativos.
- Documente com `COMMENT ON …`.

---

## 🔄 Data Manipulation Language (DML)

🎯 **Objetivos**

- Consultar e modificar dados: `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
- Filtrar, ordenar e agrupar resultados.

📖 **Contexto**
Coloca os dados em **movimento**: insere, atualiza, apaga, lê.

> Caso prático: buscar pedidos de clientes no e-commerce.

🔤 **Sintaxe & Destaques**

```sql
COMANDO tabela
  [colunas]
  [WHERE condição]
  [GROUP BY …]
  [HAVING …]
  [ORDER BY …]
  [LIMIT …];
```

💡 **Exemplos Comentados**

```sql
-- Consulta todos os clientes ativos
SELECT id, nome
FROM clientes
WHERE status = 'ativo'
ORDER BY nome;

-- Insere novo cliente
INSERT INTO clientes (nome, email)
VALUES ('Ana Silva', 'ana@exemplo.com');

-- Atualiza email de um cliente
UPDATE clientes
SET email = 'ana.silva@exemplo.com'
WHERE id = 1;

-- Remove clientes inativos
DELETE FROM clientes
WHERE status = 'inativo';
```

⚠️ **Dicas & Boas Práticas**

- Nunca faça `DELETE` sem `WHERE`.
- Use transações para operações críticas.
- Previna SQL Injection com _prepared statements_.

---

## 🔐 Data Control Language (DCL)

🎯 **Objetivos**

- Gerenciar **permissões** com `GRANT` e `REVOKE`.
- Criar roles e aplicar o princípio do menor privilégio.

📖 **Contexto**
Define **quem** pode fazer **o quê** no banco.

> Caso prático: dar acesso de leitura ao time de suporte.

🔤 **Sintaxe & Destaques**

```sql
GRANT permissão ON objeto TO usuário;
REVOKE permissão ON objeto FROM usuário;
```

- **permissão**: `SELECT`, `INSERT`, `ALL PRIVILEGES`…
- **objeto**: tabela, view, schema…

💡 **Exemplos Comentados**

```sql
-- Concede leitura e escrita em clientes
GRANT SELECT, INSERT ON clientes TO analista;

-- Remove permissão de inserção
REVOKE INSERT ON clientes FROM analista;

-- Dá todas as permissões e permite repassar
GRANT ALL ON vendas TO gerente WITH GRANT OPTION;
```

⚠️ **Dicas & Boas Práticas**

- Conceda somente o necessário (princípio do menor privilégio).
- Use _roles_ para agrupar permissões.
- Audite mudanças críticas.

---

## 🔁 Transaction Control Language (TCL)

🎯 **Objetivos**

- Controlar transações com `BEGIN`, `COMMIT`, `ROLLBACK`.
- Usar `SAVEPOINT` para pontos de restauração.
- Ajustar níveis de isolamento.

📖 **Contexto**
Garante **consistência** em operações atômicas.

> Caso prático: transferir valores entre contas bancárias.

🔤 **Sintaxe & Destaques**

```sql
BEGIN;
  -- operações DML/DDL
COMMIT;

-- ou

BEGIN;
  …
ROLLBACK;
```

- **SAVEPOINT nome** / **ROLLBACK TO nome** / **RELEASE SAVEPOINT nome**
- **SET TRANSACTION ISOLATION LEVEL**: `READ COMMITTED`, `SERIALIZABLE`…

💡 **Exemplos Comentados**

```sql
BEGIN;
  UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
  UPDATE contas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

BEGIN;
  SAVEPOINT antes_debito;
  UPDATE contas SET saldo = saldo - 100 WHERE id = 3;
  -- se falhar:
  ROLLBACK TO antes_debito;
COMMIT;
```

⚠️ **Dicas & Boas Práticas**

- Mantenha transações curtas para evitar bloqueios.
- Use `SAVEPOINT` em processos complexos.
- Defina nivel de isolamento adequado.

> Para mais detalhes, confira o guia completo em [Comandos SQL](ComandosSql/README.md).

---

✨ **Bons estudos!**
