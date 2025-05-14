# 📘 Revisão – Banco de Dados II

_Curso: Técnico em Informática – IFRS_  
_Disciplina: Banco de Dados II – 2025_

---

## 📑 Índice

- [📘 Revisão – Banco de Dados II](#-revisão--banco-de-dados-ii)
  - [📑 Índice](#-índice)
  - [Correção das Questões](#correção-das-questões)
    - [Questão 1](#questão-1)
    - [Questão 2](#questão-2)
    - [Questão 3](#questão-3)
    - [Questão 4](#questão-4)
    - [Questão 5](#questão-5)
    - [Questão 6](#questão-6)
  - [Revisão Teórica](#revisão-teórica)
    - [Transformação entre Modelos (ER → Lógico-Relacional)](#transformação-entre-modelos-er--lógico-relacional)
      - [Objetivos do Projeto Lógico](#objetivos-do-projeto-lógico)
      - [Passos da Transformação](#passos-da-transformação)
      - [Implementação Inicial de Entidades](#implementação-inicial-de-entidades)
      - [Implementação de Relacionamentos](#implementação-de-relacionamentos)
        - [Relacionamento N:M](#relacionamento-nm)
        - [Relacionamento 1:N (e (0,1):N)](#relacionamento-1n-e-01n)
        - [Relacionamento 1:1](#relacionamento-11)
        - [Resumo das Regras de Implementação](#resumo-das-regras-de-implementação)
    - [Normalização](#normalização)
    - [Generalização / Especialização](#generalização--especialização)
      - [Tabela por Entidade](#tabela-por-entidade)
      - [Tabela Única (toda a hierarquia)](#tabela-única-toda-a-hierarquia)
    - [SQL (PostgreSQL)](#sql-postgresql)
      - [DDL – Criação de Banco e Tabelas](#ddl--criação-de-banco-e-tabelas)
      - [DML – Inserção, Atualização, Exclusão](#dml--inserção-atualização-exclusão)
      - [Consultas – SELECT](#consultas--select)
      - [Transações e Controle](#transações-e-controle)
      - [Objetos Auxiliares](#objetos-auxiliares)
  - [Revisão Geral para Prova](#revisão-geral-para-prova)
    - [📖 Veja o Trabalho I](#-veja-o-trabalho-i)

---

## Correção das Questões

### Questão 1

> Em relação às características dos conceitos de modelagem de banco de dados, analise as sentenças a seguir:  
> I. Um Sistema de Gerenciamento de Banco de Dados (SGBD) é um software que incorpora as funções de definição, recuperação e alteração de dados.  
> II. Um Banco de Dados (BD) é um conjunto de arquivos integrados que atendem a um conjunto de sistemas.  
> III. O modelo de banco de dados é uma descrição formal dos tipos de dados que estão armazenados em um banco de dados.
>
> Assinale a alternativa correta:  
> a) Apenas as sentenças I e II estão corretas  
> b) Apenas as sentenças II e III estão corretas  
> c) Apenas a sentença III está correta  
> d) Apenas as sentenças I e III estão corretas  
> **e) Todas as sentenças estão corretas**

**Resposta correta:** e) Todas as sentenças estão corretas

**Explicação:**

- SGBD gerencia definição, recuperação e alteração dos dados.
- BD é o conjunto integrado de arquivos/dados.
- Modelo de dados descreve formalmente a estrutura dos dados.

**Dica extra:**

- BD = dados integrados
- SGBD = software de gerenciamento
- Modelo = estrutura abstrata dos dados

---

### Questão 2

> Em relação aos níveis de abstração do modelo de dados, relacione as colunas:
>
> 1. Modelo Conceitual
> 2. Modelo Lógico
> 3. Modelo Físico
>
> ( ) Dependente do tipo particular de tecnologia de SGBD  
> ( ) Independente do tipo de tecnologia, mostra como a estrutura dos dados aparece  
> ( ) Contém detalhes de armazenamento interno de informações

**Resposta correta:**

- (2) Modelo Lógico
- (1) Modelo Conceitual
- (3) Modelo Físico

**Explicação:**

- Conceitual: independente de tecnologia
- Lógico: depende do modelo (relacional, objeto…)
- Físico: trata do armazenamento real (arquivos, índices…)

**Dica extra:**

- Conceitual = “o que é”
- Lógico = “como será estruturado”
- Físico = “como será implementado”

---

### Questão 3

> Em relação à transformação de um modelo conceitual (diagrama ER) em modelo lógico-relacional, analise:  
> I. Consiste em realizar as traduções de entidades, relacionamentos e hierarquias  
> II. Cada entidade é traduzida para uma coluna  
> III. Cada atributo da entidade define uma linha  
> IV. Atributos identificadores da entidade viram chaves estrangeiras
>
> a) Apenas I está correta  
> b) Apenas I e II estão corretas  
> c) Apenas II e III estão corretas  
> d) Apenas III e IV estão corretas  
> **e) Todas estão corretas**

**Resposta correta:** a) Apenas I está correta

**Explicação:**

- II está errada: entidade → tabela, não coluna
- III está errada: atributo → coluna, não linha
- IV está errada: identificador → chave primária, não estrangeira

**Dica extra:**

- Entidade → tabela
- Atributo → coluna
- Identificador → PK
- FK aparece no mapeamento de relacionamentos

---

### Questão 4

> “Para a tradução dos relacionamentos de um diagrama ER para o modelo lógico-relacional é necessário observar a cardinalidade das entidades que participam do relacionamento.”
>
> ( ) CERTO  
> ( ) ERRADO

**Resposta correta:** CERTO

**Explicação:**

- A cardinalidade (1:1, 1:N, N:N) define se se usa FK, fusão de tabelas ou tabela associativa.

**Dica extra:**

- 1:1 → fusão ou FK
- 1:N → FK no lado N
- N:N → tabela extra

---

### Questão 5

> “Conforme a cardinalidade do relacionamento pode ser usada uma das seguintes abordagens: Fusão de tabelas da entidade, Colunas adicionais dentro da tabela da entidade e Tabela Própria.”
>
> ( ) CERTO  
> ( ) ERRADO

**Resposta correta:** CERTO

**Explicação:**  
| Relacionamento | Abordagem preferida |
| -------------- | --------------------------- |
| 1:1 | Fusão ou coluna adicional |
| 1:N | Coluna adicional (FK) |
| N:N | Tabela própria (associativa)|

**Dica extra:**

- Avalie participação total/parcial e cardinalidade máxima antes de mapear.

---

### Questão 6

> Relacione os tipos de relacionamento à melhor forma de tradução:
>
> 1. Relacionamentos 1:1
> 2. Relacionamentos 1:N
> 3. Relacionamentos N:N
>
> ( ) Tabela Própria  
> ( ) Fusão de Tabelas ou Adição de Colunas  
> ( ) Adição de Colunas

**Resposta correta:**

- 3 → Tabela Própria
- 1 → Fusão de Tabelas ou Adição de Colunas
- 2 → Adição de Colunas

**Explicação:**

- 1:1 → fusão ou FK
- 1:N → FK no lado N
- N:N → tabela associativa

**Dica extra:**

- Pratique com exemplos reais (ex.: alunos-cursos, departamentos-empregados).

---

## Revisão Teórica

### Transformação entre Modelos (ER → Lógico-Relacional)

#### Objetivos do Projeto Lógico

- Obter boa **performance** em consultas e atualizações
- Simplificar o **desenvolvimento** e a **manutenção**
- Evitar junções excessivas, reduzir número de chaves e campos opcionais

#### Passos da Transformação

1. Tradução de **entidades** e atributos
2. Tradução de **relacionamentos** e atributos de relacionamento
3. Tradução de **generalizações** e especializações

#### Implementação Inicial de Entidades

- Cada entidade vira uma **tabela**
- Cada atributo vira uma **coluna**
- Atributos identificadores → colunas da **chave primária**

```sql
CREATE TABLE Pessoa (
  codPessoa   SERIAL PRIMARY KEY,
  nome        VARCHAR(100),
  endereco    TEXT,
  dataNasc    DATE,
  dataAdmiss  DATE
);
```

#### Implementação de Relacionamentos

##### Relacionamento N\:M

- **Tabela própria** com FKs para cada entidade
- PK composta por todas as FKs

```sql
CREATE TABLE Engenheiro (
  codEng SERIAL PRIMARY KEY,
  nome   VARCHAR(100)
);
CREATE TABLE Projeto (
  codProj SERIAL PRIMARY KEY,
  titulo  VARCHAR(100)
);
CREATE TABLE Atuacao (
  codEng   INT REFERENCES Engenheiro(codEng),
  codProj  INT REFERENCES Projeto(codProj),
  funcao   VARCHAR(50),
  PRIMARY KEY (codEng, codProj)
);
```

##### Relacionamento 1\:N (e (0,1)\:N)

- **Coluna adicional** na tabela do lado “N”
- Insere FK + atributos do relacionamento

```sql
CREATE TABLE Departamento (
  codDepto SERIAL PRIMARY KEY,
  nome     VARCHAR(50)
);
CREATE TABLE Empregado (
  codEmp   SERIAL PRIMARY KEY,
  nome     VARCHAR(100),
  codDepto INT REFERENCES Departamento(codDepto),
  dataLot  DATE
);
```

##### Relacionamento 1:1

- **Fusão** das duas entidades em uma única tabela
- Alternativa: usar FK em uma das tabelas

```sql
CREATE TABLE Conferencia (
  codConf   SERIAL PRIMARY KEY,
  nome      VARCHAR(100),
  endereco  TEXT,
  dataInst  DATE
);
```

##### Resumo das Regras de Implementação

| Tipo de relacionamento | Tabela própria | Coluna adicional | Fusão de tabelas |
| ---------------------- | :------------: | :--------------: | :--------------: |
| 1:1                    |    Opcional    |     Opcional     |  **Preferida**   |
| 1\:N                   |    Opcional    |  **Preferida**   |     Opcional     |
| N\:M                   | **Preferida**  |     Opcional     |     Opcional     |

---

### Normalização

- **1ª Forma Normal (1FN)**
  Elimina grupos repetitivos; atributos atômicos.

- **2ª Forma Normal (2FN)**
  1FN + todos os atributos não-chave dependem da **PK inteira**.

- **3ª Forma Normal (3FN)**
  2FN + **sem dependências transitivas**.

- **BCNF (Boyce-Codd NF)**
  Toda dependência funcional X → Y deve ter X como **super-chave**.

> **Dica:** Desenhe as dependências funcionais antes de decompor tabelas.

---

### Generalização / Especialização

#### Tabela por Entidade

- Entidade genérica → tabela
- Cada entidade especializada → tabela própria com FK para genérica

```sql
CREATE TABLE Empregado (
  codEmp   SERIAL PRIMARY KEY,
  nome     VARCHAR(100),
  tipo     CHAR(1)        -- 'M'otorista, 'E'ngenheiro
);
CREATE TABLE Motorista (
  codEmp    INT PRIMARY KEY REFERENCES Empregado(codEmp),
  cartHabil VARCHAR(20)
);
CREATE TABLE Engenheiro (
  codEmp INT PRIMARY KEY REFERENCES Empregado(codEmp),
  CREA   VARCHAR(20)
);
```

#### Tabela Única (toda a hierarquia)

- Uma tabela para toda a hierarquia
- Coluna `tipo` + colunas opcionais para atributos especializados

```sql
CREATE TABLE Empregado (
  codEmp    SERIAL PRIMARY KEY,
  nome      VARCHAR(100),
  tipo      CHAR(1),
  cartHabil VARCHAR(20),  -- opcional
  CREA      VARCHAR(20)   -- opcional
);
```

---

### SQL (PostgreSQL)

#### DDL – Criação de Banco e Tabelas

- `CREATE DATABASE`, `CREATE SCHEMA`, `CREATE TABLE`
- Tipos: `INT`, `SERIAL`, `VARCHAR`, `TEXT`, `NUMERIC`, `DATE`, `TIMESTAMP`, `BOOLEAN`
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`

#### DML – Inserção, Atualização, Exclusão

- `INSERT INTO … VALUES` / `INSERT … SELECT` / `COPY`
- `UPDATE … SET … WHERE`
- `DELETE FROM … WHERE` / `TRUNCATE TABLE`

#### Consultas – SELECT

- Filtros: `WHERE`, operadores (`=`, `<>`, `LIKE`, `IN`, `BETWEEN`)
- Ordenação: `ORDER BY`, `LIMIT`, `OFFSET`
- **Joins**: `INNER JOIN`, `LEFT JOIN`, `FULL JOIN`, `CROSS JOIN`
- **Agregação**: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` + `GROUP BY`, `HAVING`
- **Subqueries**: escalares, `IN`, `EXISTS`, correlacionadas

#### Transações e Controle

- `BEGIN`, `COMMIT`, `ROLLBACK`
- ACID, níveis de isolamento (`READ COMMITTED`, `REPEATABLE READ`, `SERIALIZABLE`)
- Locks: `LOCK TABLE`, bloqueio de linha

#### Objetos Auxiliares

- **Views** (`CREATE VIEW … AS SELECT …`)
- **Índices** (`CREATE INDEX … ON …`, tipos B-tree, GIN, GiST…)
- **Triggers** e **Stored Procedures** (PL/pgSQL)
- **Sequences** (`nextval()`, `currval()`)

---

## Revisão Geral para Prova

- **Modelagem de Dados**: BD x SGBD x modelos (conceitual, lógico e físico)
- **Transformação ER → Relacional**: regras de mapeamento e cardinalidades
- **Normalização**: 1FN, 2FN, 3FN, BCNF
- **Generalização / Especialização**: tabelas por entidade vs. tabela única
- **SQL**: DDL, DML, consultas, transações, índices, views, procedures

### 📖 Veja o [Trabalho I](../trabalhos/Trabalho%20I%20Postgres/)

---

> **Correção realizada via Coppilot.**
