# ⚡ Unidade 7: Índices

## 1. O que são Índices?
Índices são estruturas de dados auxiliares (como o índice remissivo de um livro) que permitem ao SGBD encontrar linhas específicas rapidamente, sem precisar ler a tabela inteira (Full Table Scan).

### 1.1. Trade-off (Custo x Benefício)
- **Benefício:** Acelera drasticamente as consultas de leitura (`SELECT`).
- **Custo:** Deixa a escrita (`INSERT`, `UPDATE`, `DELETE`) mais lenta, pois o índice também precisa ser atualizado. Ocupa espaço em disco.

---

## 2. Tipos de Índices

### 2.1. B-Tree (Padrão)
- Balanceado, serve para igualdade (`=`) e faixas (`<`, `>`, `BETWEEN`).
- Padrão na maioria dos bancos relacionais.

### 2.2. Hash
- Apenas para igualdade exata (`=`). Muito rápido, mas não serve para faixas.

### 2.3. GIN / GiST (Postgres)
- Para tipos de dados complexos como JSONB, Arrays e Geoespacial.

---

## 3. Gerenciamento

### 3.1. Criação
```sql
-- Índice simples
CREATE INDEX idx_aluno_email ON aluno(email);

-- Índice único (garante que não há duplicatas)
CREATE UNIQUE INDEX idx_aluno_cpf ON aluno(cpf);

-- Índice composto (várias colunas)
CREATE INDEX idx_aluno_nome_curso ON aluno(nome, curso_id);
```

### 3.2. Exclusão
```sql
DROP INDEX idx_aluno_email;

-- No Postgres, para não travar a tabela em produção:
DROP INDEX CONCURRENTLY idx_aluno_email;
```

---

## 4. Quando criar índices?
- Em colunas usadas frequentemente no `WHERE`.
- Em colunas usadas em `JOIN` (FKs).
- Em colunas usadas em `ORDER BY`.
- **Evite** em tabelas muito pequenas ou colunas com baixa cardinalidade (ex: sexo M/F), onde o Full Scan pode ser mais rápido.
