# 🆚 Unidade 2: SGBD Relacional vs Não Relacional

## 1. Comparativo

| Característica | Relacional (SQL) | Não Relacional (NoSQL) |
| :--- | :--- | :--- |
| **Estrutura** | Tabelas, Esquema Rígido | Flexível (Documentos, Chave-Valor, Grafos) |
| **Dados** | Estruturados | Semi-estruturados ou Não-estruturados |
| **Escalabilidade** | Vertical (Hardware mais forte) | Horizontal (Mais máquinas/sharding) |
| **Consistência** | ACID (Atomicidade, Consistência, Isolamento, Durabilidade) | BASE (Basically Available, Soft state, Eventual consistency) |
| **Linguagem** | SQL (Padronizada) | Específica (ex: MongoDB Query Language) |
| **Exemplos** | PostgreSQL, MySQL, Oracle | MongoDB, Redis, Cassandra, Neo4j |

---

## 2. Instalação e Configuração

### 2.1. PostgreSQL (Relacional)
- **Instalação:** Baixar binários ou usar gerenciador de pacotes (`apt`, `brew`, `choco`).
- **Configuração:**
    - `postgresql.conf`: Ajuste de memória, portas (padrão 5432).
    - `pg_hba.conf`: Controle de acesso (quem pode conectar e como).
- **Inicialização:** `initdb` cria o cluster de dados.

### 2.2. MongoDB (NoSQL - Documentos)
- **Instalação:** Baixar Community Edition.
- **Configuração:**
    - `mongod.conf`: Caminho dos dados (`storage.dbPath`), IP de bind (`net.bindIp`).
- **Conceitos:**
    - **Database:** Contém coleções.
    - **Collection:** Contém documentos (equivalente a tabela).
    - **Document:** Dados em formato BSON (Binary JSON).

---

## 3. Criação de Banco de Dados

### 3.1. SQL
```sql
CREATE DATABASE ifrs2025
    WITH OWNER = admin
    ENCODING = 'UTF8';
```

### 3.2. MongoDB
Não há comando explícito de criação. O banco é criado automaticamente ao inserir o primeiro dado.
```javascript
use ifrs2025
db.createCollection("teste")
```
