# ⚙️ Unidade 8: Procedimentos, Funções e Gatilhos

## 1. Funções e Procedimentos
Blocos de código armazenados no banco para encapsular lógica de negócios.

### 1.1. Funções (Functions)
- Retornam valor.
- Podem ser usadas dentro de um `SELECT`.
- Geralmente usadas para cálculos.

```sql
CREATE OR REPLACE FUNCTION fn_total_alunos(p_curso INT)
RETURNS INT LANGUAGE sql AS $$
    SELECT COUNT(*) FROM aluno WHERE curso_id = p_curso;
$$;

-- Uso
SELECT nome, fn_total_alunos(id) FROM curso;
```

### 1.2. Procedimentos (Stored Procedures)
- Não retornam valor diretamente (podem ter parâmetros OUT).
- Usados para executar ações (INSERT, UPDATE) e controle de transação (`COMMIT`/`ROLLBACK`).
- Chamados com `CALL`.

```sql
CREATE OR REPLACE PROCEDURE sp_transferir_aluno(
    p_aluno INT,
    p_curso_dest INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE aluno SET curso_id = p_curso_dest WHERE id = p_aluno;
    -- Poderia ter um COMMIT aqui
END;
$$;

-- Uso
CALL sp_transferir_aluno(10, 2);
```

---

## 2. Gatilhos (Triggers)
Procedimentos automáticos disparados por eventos (`INSERT`, `UPDATE`, `DELETE`).

### 2.1. Componentes
- **Evento:** O que dispara (ex: `AFTER INSERT`).
- **Tabela:** Onde ocorre.
- **Função:** O que executar.
- **Variáveis Especiais:** `NEW` (novo dado), `OLD` (dado antigo).

### 2.2. Exemplo: Auditoria
```sql
-- 1. Tabela de Log
CREATE TABLE log_aluno (
    id SERIAL PRIMARY KEY,
    aluno_id INT,
    operacao TEXT,
    data TIMESTAMP DEFAULT NOW()
);

-- 2. Função do Gatilho
CREATE OR REPLACE FUNCTION fn_log_aluno()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO log_aluno(aluno_id, operacao)
    VALUES (NEW.id, TG_OP);
    RETURN NEW;
END;
$$;

-- 3. Criação do Gatilho
CREATE TRIGGER trg_audit_aluno
AFTER INSERT OR UPDATE ON aluno
FOR EACH ROW
EXECUTE FUNCTION fn_log_aluno();
```
