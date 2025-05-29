<!-- ===============================
     🔐 Data Control Language (DCL)
     =============================== -->

# 🔐 Data Control Language (DCL)

> “Controle o acesso. Proteja os dados.”

---

## 🎯 Objetivos de Aprendizagem

- **Básico**: Compreender os comandos `GRANT` e `REVOKE`.
- **Intermediário**: Atribuir e remover permissões específicas de leitura, escrita e administração.
- **Avançado**: Gerenciar privilégios em ambientes multiusuário com segurança e boas práticas.

---

## 📖 Introdução & Contexto

A **DCL** (Data Control Language) define quem **pode acessar** ou **modificar** dados dentro de um banco. É essencial em sistemas com múltiplos usuários e garante que cada um tenha apenas as permissões necessárias.

> **Caso prático**:
> Em um sistema bancário:
>
> - O gerente pode ter acesso total às contas
> - O caixa pode apenas consultar e registrar transações
> - Um auditor pode apenas visualizar os dados

---

## 🔤 Sintaxe Geral & Destaques

```sql
GRANT permissao ON objeto TO usuario;
REVOKE permissao ON objeto FROM usuario;
```

- **GRANT**: Concede permissões
- **REVOKE**: Revoga permissões
- **permissao**: `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `ALL PRIVILEGES` etc.
- **objeto**: tabela, visão (view), sequência, banco etc.
- **usuario**: nome do usuário ou role

---

## 📋 Detalhamento dos Elementos

| Comando             | Descrição                                            | Caso de Uso                           |
| ------------------- | ---------------------------------------------------- | ------------------------------------- |
| `GRANT`             | Concede permissões                                   | Permitir leitura na tabela `clientes` |
| `REVOKE`            | Remove permissões concedidas anteriormente           | Revogar acesso de escrita             |
| `ALL`               | Concede todas as permissões                          | Usuário com controle total            |
| `WITH GRANT OPTION` | Permite que o usuário conceda as permissões a outros | Administradores delegando acesso      |

---

## 💡 Exemplos Comentados

### Concedendo Permissões

```sql
GRANT SELECT, INSERT ON clientes TO analista;  -- permite consultar e inserir dados
```

### Removendo Permissões

```sql
REVOKE INSERT ON clientes FROM analista;      -- remove apenas a permissão de inserção
```

### Permissão com Delegação

```sql
GRANT ALL ON contas TO gerente WITH GRANT OPTION;  -- gerente pode repassar permissões
```

---

## ⚠️ Dicas e Boas Práticas

- Conceda apenas o necessário: **mínimo privilégio** é uma regra de ouro.
- Use **roles** para facilitar o gerenciamento de permissões em grupos.
- Monitore alterações de privilégios com auditoria em ambientes críticos.
- Combine com views para restringir o acesso a colunas sensíveis.

---

## 🧩 Exercícios de Fixação

- Dê permissão de leitura na tabela `livros` para o usuário `bibliotecario`.

  ```sql
  GRANT SELECT ON livros TO bibliotecario;
  ```

- Revogue todas as permissões da tabela `usuarios` do usuário `estagiario`.

- Crie um exemplo onde um usuário recebe permissão total e pode concedê-la a outros:

  ```sql
  GRANT ALL ON emprestimos TO coordenador WITH GRANT OPTION;
  ```

---

## 📚 Referências

- W3Schools — [SQL GRANT / REVOKE](https://www.w3schools.com/sql/sql_grant_revoke.asp)
- PostgreSQL Docs — [GRANT](https://www.postgresql.org/docs/current/sql-grant.html)
- PostgreSQL Docs — [REVOKE](https://www.postgresql.org/docs/current/sql-revoke.html)

---
