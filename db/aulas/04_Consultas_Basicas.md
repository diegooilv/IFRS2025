# 📝 Unidade 4: DML e Consultas Básicas

## 1. Inserção (INSERT)

### 1.1. SQL
```sql
-- Inserir especificando colunas
INSERT INTO aluno (nome, curso_id, data_nascimento)
VALUES ('Ana Souza', 1, '2002-05-14');

-- Inserir múltiplas linhas
INSERT INTO curso (nome) VALUES ('Informática'), ('Administração');

-- Inserir a partir de uma consulta
INSERT INTO historico_aluno (nome, antigo_curso)
SELECT nome, curso_id FROM aluno WHERE ativo = FALSE;
```

### 1.2. MongoDB
```javascript
db.aluno.insertOne({ nome: "Ana", curso_id: ObjectId("...") });
db.aluno.insertMany([{ nome: "Pedro" }, { nome: "Maria" }]);
```

---

## 2. Atualização (UPDATE)

### 2.1. SQL
```sql
UPDATE aluno
SET curso_id = 2,
    atualizado_em = CURRENT_TIMESTAMP
WHERE id = 10;
```
> ⚠️ **Atenção:** Sempre use `WHERE` no UPDATE, senão atualizará a tabela inteira!

### 2.2. MongoDB
```javascript
db.aluno.updateOne({ _id: 10 }, { $set: { curso_id: 2 } });
db.aluno.updateMany({ ativo: true }, { $set: { status: "regular" } });
```

---

## 3. Exclusão (DELETE)

### 3.1. SQL
```sql
DELETE FROM aluno WHERE id = 10;
```
> ⚠️ **Atenção:** Sempre use `WHERE` no DELETE!

### 3.2. MongoDB
```javascript
db.aluno.deleteOne({ _id: 10 });
db.aluno.deleteMany({ status: "inativo" });
```

---

## 4. Consulta (SELECT)

A estrutura básica é `SELECT ... FROM ... WHERE ...`.

### 4.1. Seleção Simples
```sql
-- Todas as colunas
SELECT * FROM aluno;

-- Colunas específicas (Projeção)
SELECT nome, email FROM aluno;
```

### 4.2. Filtragem (WHERE)
```sql
SELECT * FROM aluno WHERE curso_id = 1;
SELECT * FROM aluno WHERE carga_horaria > 60 AND ativo = TRUE;
SELECT * FROM aluno WHERE nome LIKE 'A%'; -- Começa com A
SELECT * FROM aluno WHERE id IN (1, 2, 3);
```

### 4.3. Ordenação (ORDER BY)
```sql
SELECT * FROM aluno ORDER BY nome ASC; -- Crescente
SELECT * FROM aluno ORDER BY data_nascimento DESC; -- Decrescente
```

### 4.4. Funções de Agregação
Processam um conjunto de valores e retornam um único valor.
- `COUNT(*)`: Conta linhas.
- `SUM(coluna)`: Soma valores.
- `AVG(coluna)`: Média.
- `MAX(coluna)` / `MIN(coluna)`: Máximo e Mínimo.

```sql
SELECT COUNT(*) FROM aluno;
SELECT AVG(nota) FROM avaliacao WHERE aluno_id = 5;
```

### 4.5. Agrupamento (GROUP BY)
Agrupa linhas com valores iguais.
```sql
-- Quantos alunos existem em cada curso?
SELECT curso_id, COUNT(*)
FROM aluno
GROUP BY curso_id;
```

### 4.6. Filtro no Grupo (HAVING)
Filtra **após** o agrupamento.
```sql
-- Cursos com mais de 30 alunos
SELECT curso_id, COUNT(*)
FROM aluno
GROUP BY curso_id
HAVING COUNT(*) > 30;
```
