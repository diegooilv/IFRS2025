<!-- ===============================
     🔁 Transaction Control Language (TCL)
     =============================== -->

# 🔁 Transaction Control Language (TCL)

> “Garanta a integridade: inicie, confirme ou desfaça transações.”

---

## 🎯 Objetivos de Aprendizagem

- **Básico**: Entender comandos `BEGIN`, `COMMIT` e `ROLLBACK`.
- **Intermediário**: Usar `SAVEPOINT` e `ROLLBACK TO` para controlar pontos dentro de uma transação.
- **Avançado**: Definir níveis de isolamento com `SET TRANSACTION` e otimizar performance transacional.

---

## 📖 Introdução & Contexto

A **TCL** (Transaction Control Language) gerencia blocos atômicos de operações de banco de dados.  
Enquanto DDL define estruturas e DML mexe nos dados, a TCL garante que um conjunto de comandos seja aplicado por completo ou desfeito integralmente.

> **Caso prático**:  
> Num sistema de pagamentos online, uma transação pode envolver:
>
> - Debitar conta do pagador
> - Creditar conta do recebedor
> - Registrar o log de auditoria  
>   Tudo deve ocorrer ou tudo deve ser revertido em caso de falha.

---

## 🔤 Sintaxe Geral & Destaques

```sql
BEGIN;                       -- inicia uma transação
  COMANDOS DML/DDL…          -- operações dentro da transação
COMMIT;                      -- confirma todas as mudanças

-- ou

BEGIN;
  …
ROLLBACK;                    -- desfaz todas as mudanças
```

- **BEGIN** (ou `START TRANSACTION`): inicia o bloco transacional
- **COMMIT**: grava de forma permanente todas as alterações
- **ROLLBACK**: reverte todas as alterações realizadas na transação
- **SAVEPOINT nome**: marca um ponto intermediário
- **ROLLBACK TO nome**: desfaz até o savepoint
- **RELEASE SAVEPOINT nome**: remove o savepoint

---

## 📋 Detalhamento dos Elementos

| Comando                 | Descrição                                              | Caso de Uso                                   |
| ----------------------- | ------------------------------------------------------ | --------------------------------------------- |
| `BEGIN`                 | Inicia nova transação                                  | Agrupar múltiplos INSERT/UPDATE em lote       |
| `COMMIT`                | Confirma alterações                                    | Gratifica sucesso de processamento financeiro |
| `ROLLBACK`              | Desfaz todas as alterações desde o BEGIN               | Tratar erro crítico e cancelar operação       |
| `SAVEPOINT`             | Cria ponto de restauração parcial                      | Gerenciar falhas em operações complexas       |
| `ROLLBACK TO SAVEPOINT` | Reverte até o savepoint sem abortar toda a transação   | Corrigir apenas parte da transação            |
| `RELEASE SAVEPOINT`     | Descarrega o savepoint                                 | Liberar recursos após sucesso parcial         |
| `SET TRANSACTION`       | Define propriedades (isolamento, read only/read write) | Ajustar desempenho e concorrência             |

---

## 💡 Exemplos Comentados

```sql
BEGIN;
  UPDATE conta SET saldo = saldo - 100 WHERE id = 1;     -- debita pagador
  UPDATE conta SET saldo = saldo + 100 WHERE id = 2;     -- credita recebedor
COMMIT;                                                  -- confirma ambas
```

```sql
BEGIN;
  INSERT INTO pedidos (…) VALUES (…);                   -- cria pedido
  SAVEPOINT antes_pagamento;                            -- marca antes do pagamento
  UPDATE conta SET saldo = saldo - total WHERE id = 3;  -- tenta débito
  -- se falhar:
  ROLLBACK TO antes_pagamento;                          -- volta ao ponto marcado
  RELEASE SAVEPOINT antes_pagamento;                    -- remove marcação
COMMIT;
```

```sql
BEGIN;
  -- operações…
ROLLBACK;  -- reverte tudo se algo deu errado
```

---

## ⚠️ Dicas e Boas Práticas

- Mantenha transações **curtas**: evite bloqueios prolongados.
- Use `SAVEPOINT` para pontos de controle em processos complexos.
- Defina nível de isolamento adequado para o caso de uso (`READ COMMITTED`, `SERIALIZABLE`).
- Trate exceções no cliente e assegure `ROLLBACK` em erros.
- Monitore transações longas para prevenir deadlocks.

---

## 🧩 Exercícios de Fixação

- Iniciar uma transação que insira um usuário e crie seu perfil; depois confirme ou desfaça tudo.
- Criar um savepoint antes de atualizar estoque e, em caso de quantidade negativa, retornar ao ponto sem abortar transação inteira.
- Definir o nível de isolamento para `SERIALIZABLE` e verificar comportamento em leituras concorrentes.

---

## 📚 Referências

- W3Schools — [SQL Transaction Control](https://www.w3schools.com/sql/sql_transaction.asp)
- PostgreSQL Docs — [BEGIN](https://www.postgresql.org/docs/current/sql-begin.html), [SAVEPOINT](https://www.postgresql.org/docs/current/sql-savepoint.html)

---
