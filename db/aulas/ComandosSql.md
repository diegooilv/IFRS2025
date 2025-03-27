# Comandos SQL

---

## Data Definition Language (DDL)

A **Data Definition Language (DDL)** é utilizada para definir, modificar e remover estruturas de banco de dados. Esses comandos afetam diretamente o esquema (estrutura) do banco de dados.

### Principais Comandos DDL

- **CREATE:** Cria objetos no banco de dados, como tabelas, índices, ou views.  
  *Exemplo:*
  ```sql
  CREATE TABLE clientes (
      id INT PRIMARY KEY,
      nome VARCHAR(100),
      email VARCHAR(100)
  );
  ```

- **ALTER:** Modifica a estrutura de objetos existentes no banco de dados.  
  *Exemplo:*
  ```sql
  ALTER TABLE clientes ADD COLUMN telefone VARCHAR(20);
  ```

- **DROP:** Remove objetos do banco de dados.  
  *Exemplo:*
  ```sql
  DROP TABLE clientes;
  ```

- **TRUNCATE:** Remove todos os registros de uma tabela, mantendo sua estrutura para reutilização.  
  *Exemplo:*
  ```sql
  TRUNCATE TABLE clientes;
  ```

---

## Data Manipulation Language (DML)

A **Data Manipulation Language (DML)** é empregada para manipular os dados armazenados nas tabelas. Esses comandos permitem inserir, atualizar, excluir e consultar dados.

### Principais Comandos DML

- **INSERT:** Insere novos registros em uma tabela.  
  *Exemplo:*
  ```sql
  INSERT INTO clientes (id, nome, email) VALUES (1, 'João Silva', 'joao@example.com');
  ```

- **SELECT:** Consulta dados, permitindo extrair informações armazenadas no banco de dados.  
  *Exemplo:*
  ```sql
  SELECT * FROM clientes;
  ```

- **UPDATE:** Atualiza os dados existentes em uma tabela.  
  *Exemplo:*
  ```sql
  UPDATE clientes SET email = 'joao.novo@example.com' WHERE id = 1;
  ```

- **DELETE:** Remove registros de uma tabela.  
  *Exemplo:*
  ```sql
  DELETE FROM clientes WHERE id = 1;
  ```

---

## Data Control Language (DCL)

A **Data Control Language (DCL)** é utilizada para definir e controlar o acesso aos dados no banco de dados. Esses comandos gerenciam permissões e privilégios dos usuários.

### Principais Comandos DCL

- **GRANT:** Concede permissões a usuários ou roles para acessar e manipular objetos do banco de dados.  
  *Exemplo:*
  ```sql
  GRANT SELECT, INSERT ON clientes TO usuario_exemplo;
  ```

- **REVOKE:** Remove permissões concedidas anteriormente.  
  *Exemplo:*
  ```sql
  REVOKE INSERT ON clientes FROM usuario_exemplo;
  ```

---

## Transaction Control Language (TCL)

A **Transaction Control Language (TCL)** gerencia as transações no banco de dados, garantindo a integridade e consistência dos dados durante operações que envolvem múltiplas instruções.

### Principais Comandos TCL

- **COMMIT:** Confirma todas as alterações realizadas durante a transação corrente, tornando-as permanentes.  
  *Exemplo:*
  ```sql
  BEGIN;
  INSERT INTO clientes (id, nome, email) VALUES (2, 'Maria Souza', 'maria@example.com');
  COMMIT;
  ```

- **ROLLBACK:** Desfaz todas as alterações realizadas durante a transação corrente, revertendo o estado do banco de dados para o último COMMIT.  
  *Exemplo:*
  ```sql
  BEGIN;
  INSERT INTO clientes (id, nome, email) VALUES (3, 'Pedro Lima', 'pedro@example.com');
  ROLLBACK;
  ```

- **SAVEPOINT:** Define pontos de salvaguarda dentro de uma transação, permitindo reverter parte das operações sem cancelar toda a transação.  
  *Exemplo:*
  ```sql
  BEGIN;
  INSERT INTO clientes (id, nome, email) VALUES (4, 'Ana Paula', 'ana@example.com');
  SAVEPOINT sp1;
  UPDATE clientes SET email = 'ana.nova@example.com' WHERE id = 4;
  ROLLBACK TO SAVEPOINT sp1;
  COMMIT;
  ```

- **SET TRANSACTION:** Define propriedades da transação, como o nível de isolamento.  
  *Exemplo:*
  ```sql
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  ```

---

