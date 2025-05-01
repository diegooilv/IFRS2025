-- 1. TIME
CREATE TABLE "Time" (
  codTime      SERIAL PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  sigla        VARCHAR(10)  UNIQUE NOT NULL
);

-- 2. TORNEIO
CREATE TABLE "Torneio" (
  codTorneio   SERIAL PRIMARY KEY,
  premio       NUMERIC(12,2),
  data         DATE         NOT NULL,
  nome         VARCHAR(100) NOT NULL
);

-- 3. JOGADOR
CREATE TABLE "Jogador" (
  codJogador   SERIAL PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  email        VARCHAR(255) UNIQUE NOT NULL,
  apelido      VARCHAR(50),
  codTime      INT REFERENCES "Time"(codTime)    -- NULL permitido: 0..1
);

-- 4. PARTICIPACAO
CREATE TABLE "Participacao" (
  codParticipacao SERIAL PRIMARY KEY,
  codTime         INT NOT NULL REFERENCES "Time"(codTime),
  codTorneio      INT NOT NULL REFERENCES "Torneio"(codTorneio),
  posicao         INT
);

-- 5. JOGO
CREATE TABLE "Jogo" (
  codJogo            SERIAL PRIMARY KEY,
  codTorneio         INT NOT NULL REFERENCES "Torneio"(codTorneio),
  codTimeMandante    INT NOT NULL REFERENCES "Time"(codTime),
  codTimeVisitante   INT NOT NULL REFERENCES "Time"(codTime),
  ptsTimeMandante    INT,
  ptsTimeVisitante   INT,
  nomeJogo           VARCHAR(100) NOT NULL
);
