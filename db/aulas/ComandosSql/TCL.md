# ↩️ TCL - Transaction Control Language

A **Linguagem de Controle de Transação** (TCL) gerencia as transações no banco de dados, garantindo a propriedade ACID (Atomicidade).

---

## 1. BEGIN / START TRANSACTION
Inicia uma nova transação. Todas as operações seguintes são temporárias até serem confirmadas.

```sql
BEGIN;
UPDATE conta SET saldo = saldo - 100 WHERE id = 1;
UPDATE conta SET saldo = saldo + 100 WHERE id = 2;
```

---

## 2. COMMIT (Confirmar)
Salva permanentemente todas as alterações da transação atual.

```sql
COMMIT;
```

---

## 3. ROLLBACK (Desfazer)
Descarta todas as alterações da transação atual, voltando ao estado anterior ao BEGIN.

```sql
-- Se algo deu errado...
ROLLBACK;
```

---

## 4. SAVEPOINT
Cria um ponto de restauração dentro de uma transação.

```sql
BEGIN;
INSERT INTO log VALUES ('Inicio');
SAVEPOINT ponto1;
INSERT INTO log VALUES ('Meio');
-- Volta para o ponto1 (desfaz o 'Meio', mas mantém o 'Inicio')
ROLLBACK TO SAVEPOINT ponto1;
COMMIT;
```
