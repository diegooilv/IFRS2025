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

-- 1) TIMES (equipes de Brawl Stars)
INSERT INTO "Time"(codTime, nome, sigla) VALUES
( 1, 'SK Gaming',           'SKG'),
( 2, 'Team Queso',          'TQO'),
( 3, 'Nova Esports',        'NES'),
( 4, 'Evil Geniuses',       'EGS'),
( 5, 'TNL eSports',         'TNL'),
( 6, 'G2 Esports',          'G2E'),
( 7, 'BEASTCOAST',          'BST'),
( 8, 'BIG BAWS',            'BBW'),
( 9, 'Tribe Gaming',        'TGB'),
(10, 'SCARZ',               'SCZ'),
(11, 'BTXL',                'BTX'),
(12, 'ZeroZone',            'ZZN'),
(13, 'Forg1ven',            'FGV'),
(14, 'Team Heretics',       'THS'),
(15, 'REV Gaming',          'REV');

-- 2) TORNEIOS (circuito 2024 de Brawl Stars)
INSERT INTO "Torneio"(codTorneio, premio, data, nome) VALUES
( 1, 100000.00, '2024-02-15', 'Spring Cup 2024'),
( 2, 120000.00, '2024-03-10', 'European Challenge'),
( 3, 150000.00, '2024-04-05', 'NA Open 2024'),
( 4, 200000.00, '2024-05-20', 'Asia Invitational'),
( 5, 180000.00, '2024-06-18', 'Worlds Qualifier'),
( 6, 300000.00, '2024-07-25', 'Brawl Stars Championship 2024'),
( 7, 130000.00, '2024-08-12', 'Latin America Cup'),
( 8, 110000.00, '2024-09-03', 'Oceanic Showdown'),
( 9, 160000.00, '2024-10-10', 'All-Stars League'),
(10, 250000.00, '2024-11-15', 'Worlds Finals'),
(11,  90000.00, '2024-01-28', 'Winter Clash'),
(12, 140000.00, '2024-05-05', 'Mid-Season Mayhem'),
(13, 170000.00, '2024-08-30', 'Battle Royale Show'),
(14, 125000.00, '2024-10-22', 'Fall Fracas'),
(15,  80000.00, '2024-12-05', 'Year-End Invitational');

-- 3) JOGADORES (pro players, cada um em um team)
INSERT INTO "Jogador"(codJogador, nome, email, apelido, codTime) VALUES
( 1, 'Sweet',           'sweet@skg.com',   'Sweet',      1),
( 2, 'Mojito',          'mojito@tqo.com',  'Mojito',     2),
( 3, 'Papi',            'papi@nes.com',    'Papi',       3),
( 4, 'Rogue',           'rogue@egs.com',   'Rogue',      4),
( 5, 'Cody',            'cody@tnl.com',    'Cody',       5),
( 6, 'Arnott',          'arnott@g2e.com',  'Arnott',     6),
( 7, 'Gunner',          'gunner@bst.com',  'Gunner',     7),
( 8, 'Logos',           'logos@bbw.com',   'Logos',      8),
( 9, 'Saifu',           'saifu@tgb.com',   'Saifu',      9),
(10, 'Brianna',         'brianna@scz.com', 'Brianna',   10),
(11, 'Yujin',           'yujin@btx.com',   'Yujin',     11),
(12, 'GeorGe',          'george@zzn.com',  'GeorGe',    12),
(13, 'Loon',            'loon@fgv.com',    'Loon',      13),
(14, 'KLuK',            'kluk@ths.com',    'KLuK',      14),
(15, 'SRony',           'srony@rev.com',   'SRony',     15);

-- 4) PARTICIPAÇÕES (posições em cada torneio)
INSERT INTO "Participacao"(codParticipacao, codTime, codTorneio, posicao) VALUES
( 1,  1,  1,  2),
( 2,  2,  1,  5),
( 3,  3,  2,  1),
( 4,  4,  2,  3),
( 5,  5,  3,  4),
( 6,  6,  3,  2),
( 7,  7,  4,  6),
( 8,  8,  4,  1),
( 9,  9,  5,  3),
(10, 10,  5,  7),
(11, 11,  6,  1),
(12, 12,  6,  4),
(13, 13,  7,  2),
(14, 14,  8,  5),
(15, 15, 10,  3);

-- 5) JOGOS (15 partidas com placares e torneios)
INSERT INTO "Jogo"
  (codJogo, codTorneio, codTimeMandante, codTimeVisitante, ptsTimeMandante, ptsTimeVisitante, nomeJogo)
VALUES
(  1,  1,  1,  2,  3,  2, 'SK Gaming x Team Queso'),
(  2,  1,  3,  4,  1,  1, 'Nova Esports x Evil Geniuses'),
(  3,  2,  5,  6,  0,  2, 'TNL eSports x G2 Esports'),
(  4,  2,  7,  8,  2,  3, 'BEASTCOAST x BIG BAWS'),
(  5,  3,  9, 10,  4,  1, 'Tribe Gaming x SCARZ'),
(  6,  3, 11, 12,  2,  2, 'BTXL x ZeroZone'),
(  7,  4, 13, 14,  1,  0, 'Forg1ven x Team Heretics'),
(  8,  4, 15,  1,  3,  2, 'REV Gaming x SK Gaming'),
(  9,  5,  2,  3,  2,  1, 'Team Queso x Nova Esports'),
( 10,  5,  4,  5,  0,  3, 'Evil Geniuses x TNL eSports'),
( 11,  6,  6,  7,  1,  1, 'G2 Esports x BEASTCOAST'),
( 12,  6,  8,  9,  4,  0, 'BIG BAWS x Tribe Gaming'),
( 13,  7, 10, 11,  2,  3, 'SCARZ x BTXL'),
( 14,  8, 12, 13,  1,  4, 'ZeroZone x Forg1ven'),
( 15, 10, 14, 15,  3,  2, 'Team Heretics x REV Gaming');
