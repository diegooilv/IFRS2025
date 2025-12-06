# 🏗️ Unidade 3: Estrutura de Tabelas (DDL)

## 1. Criação de Tabelas (SQL)

O comando `CREATE TABLE` define a estrutura de armazenamento.

```sql
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) UNIQUE,
    data_nascimento DATE,
    curso_id INTEGER REFERENCES curso(id),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 1.1. Tipos de Dados Comuns
- **Inteiros:** `SMALLINT`, `INTEGER`, `BIGINT`, `SERIAL` (auto-incremento).
- **Texto:** `VARCHAR(n)` (tamanho variável), `CHAR(n)` (tamanho fixo), `TEXT` (ilimitado).
- **Data/Hora:** `DATE`, `TIME`, `TIMESTAMP` (data + hora).
- **Outros:** `BOOLEAN`, `NUMERIC(p,s)` (exatidão decimal), `JSONB` (Postgres).

### 1.2. Restrições (Constraints)
- **PRIMARY KEY:** Identificador único. Não nulo.
- **FOREIGN KEY:** Garante integridade referencial.
- **NOT NULL:** Obriga o preenchimento.
- **UNIQUE:** Garante unicidade (mas permite nulos, exceto se for PK).
- **CHECK:** Validação customizada (ex: `CHECK (idade >= 18)`).
- **DEFAULT:** Valor padrão se nada for informado.

---

## 2. Modelagem NoSQL (MongoDB)

No MongoDB, não é obrigatório definir esquema, mas é uma boa prática usar **Schema Validation**.

```javascript
db.createCollection("aluno", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["nome", "curso_id"],
      properties: {
        nome: { bsonType: "string", maxLength: 120 },
        curso_id: { bsonType: "objectId" },
        cpf: { bsonType: "string", pattern: "^[0-9]{11}$" },
        criado_em: { bsonType: "date" }
      }
    }
  }
});
```

---

## 3. Alteração de Estrutura (ALTER)

### 3.1. SQL
```sql
-- Adicionar coluna
ALTER TABLE aluno ADD COLUMN email VARCHAR(150);

-- Adicionar restrição
ALTER TABLE aluno ADD CONSTRAINT uq_email UNIQUE (email);

-- Alterar tipo de dado
ALTER TABLE aluno ALTER COLUMN nome TYPE VARCHAR(200);

-- Remover coluna
ALTER TABLE aluno DROP COLUMN cpf;
```

### 3.2. MongoDB
Para alterar a validação, usa-se o comando `collMod`.
```javascript
db.runCommand({
  collMod: "aluno",
  validator: { ...novo_schema... }
})
```

---

## 4. Eliminação (DROP)

Cuidado! Esses comandos apagam a estrutura e **todos os dados**.

```sql
-- Apaga a tabela. Falha se houver dependências.
DROP TABLE aluno;

-- Apaga a tabela e tudo que depende dela (views, FKs).
DROP TABLE aluno CASCADE;
```

No MongoDB:
```javascript
db.aluno.drop()
```
