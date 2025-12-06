# 🔒 DCL - Data Control Language

A **Linguagem de Controle de Dados** (DCL) gerencia permissões e acesso ao banco de dados.

---

## 1. GRANT (Conceder)
Dá permissões a um usuário ou role.

### 1.1. Sintaxe Básica
```sql
GRANT [PRIVILÉGIOS] ON [OBJETO] TO [USUÁRIO];
```

### 1.2. Exemplos
```sql
-- Permitir que o usuário 'estagiario' apenas leia a tabela 'aluno'
GRANT SELECT ON aluno TO estagiario;

-- Permitir tudo na tabela 'curso' para 'gerente'
GRANT ALL PRIVILEGES ON curso TO gerente;

-- Permitir conectar no banco
GRANT CONNECT ON DATABASE ifrs2025 TO usuario_web;
```

---

## 2. REVOKE (Revogar)
Remove permissões previamente concedidas.

### 2.1. Sintaxe Básica
```sql
REVOKE [PRIVILÉGIOS] ON [OBJETO] FROM [USUÁRIO];
```

### 2.2. Exemplos
```sql
REVOKE DELETE ON aluno FROM estagiario;
```
