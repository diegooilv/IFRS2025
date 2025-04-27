-- Tabela de usuários
CREATE TABLE usuarios (
  id          SERIAL       PRIMARY KEY,
  nome        VARCHAR(100) NOT NULL,
  email       VARCHAR(100) NOT NULL UNIQUE,
  senha       VARCHAR(100) NOT NULL,
  criado_em   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Tabela de filmes
CREATE TABLE filmes (
  id          SERIAL       PRIMARY KEY,
  nome        VARCHAR(100) NOT NULL,
  genero      VARCHAR(50)  NOT NULL,
  descricao   TEXT,
  criado_em   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Tabela de séries
CREATE TABLE series (
  id          SERIAL       PRIMARY KEY,
  nome        VARCHAR(100) NOT NULL,
  temporadas  INT          NOT NULL,
  genero      VARCHAR(50)  NOT NULL,
  descricao   TEXT,
  criado_em   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Avaliações de filmes (1 avaliação → 1 usuário, 1 filme)
CREATE TABLE avaliacoes_filmes (
  id            SERIAL       PRIMARY KEY,
  usuario_id    INT          NOT NULL
                   REFERENCES usuarios(id)  ON DELETE CASCADE,
  filme_id      INT          NOT NULL
                   REFERENCES filmes(id)    ON DELETE CASCADE,
  nota          REAL         NOT NULL,
  comentario    TEXT,
  criado_em     TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Avaliações de séries (1 avaliação → 1 usuário, 1 série)
CREATE TABLE avaliacoes_series (
  id            SERIAL       PRIMARY KEY,
  usuario_id    INT          NOT NULL
                   REFERENCES usuarios(id) ON DELETE CASCADE,
  serie_id      INT          NOT NULL
                   REFERENCES series(id)   ON DELETE CASCADE,
  nota          REAL         NOT NULL,
  comentario    TEXT,
  criado_em     TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- Favoritos de avaliações de filmes (N:N entre usuários e avaliações de filmes)
CREATE TABLE favoritos_filmes (
  usuario_id           INT         NOT NULL
                          REFERENCES usuarios(id)         ON DELETE CASCADE,
  avaliacao_filme_id   INT         NOT NULL
                          REFERENCES avaliacoes_filmes(id) ON DELETE CASCADE,
  criado_em            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (usuario_id, avaliacao_filme_id)
);

-- Favoritos de avaliações de séries (N:N entre usuários e avaliações de séries)
CREATE TABLE favoritos_series (
  usuario_id           INT         NOT NULL
                          REFERENCES usuarios(id)        ON DELETE CASCADE,
  avaliacao_serie_id   INT         NOT NULL
                          REFERENCES avaliacoes_series(id) ON DELETE CASCADE,
  criado_em            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (usuario_id, avaliacao_serie_id)
);

-- Inserções de dados

-- Usuários
INSERT INTO usuarios (nome, email, senha) VALUES
  ('Diego Lima',    'diego@example.com',    'senha123'),
  ('Ana Souza',     'ana@example.com',      'senha456'),
  ('Carlos Mendes', 'carlos@example.com',   'abc123'),
  ('Lúcia Ferreira','lucia@example.com',    'minhasenha'),
  ('Pedro Gomes',   'pedro@example.com',    '123senha'),
  ('Juliana Rocha', 'juliana@example.com',  'jurocha22'),
  ('Rafael Silva',  'rafael@example.com',   'pass987'),
  ('Bianca Costa',  'bianca@example.com',   'senha@bi'),
  ('Tiago Martins', 'tiago@example.com',    'martins2025'),
  ('Laura Dias',    'laura@example.com',    'ldias#321');

-- Filmes
INSERT INTO filmes (nome, genero, descricao) VALUES
  ('A Origem',               'Ficção Científica', 'Um ladrão de sonhos em realidades paralelas'),
  ('O Poderoso Chefão',      'Drama',             'A saga de uma família mafiosa'),
  ('Vingadores: Ultimato',   'Ação',              'Heróis enfrentam Thanos'),
  ('Parasita',               'Suspense',          'Família pobre se infiltra na casa de ricos'),
  ('O Rei Leão',             'Animação',          'O ciclo da vida na savana africana'),
  ('Interestelar',           'Ficção Científica', 'Viagem no espaço e tempo para salvar a humanidade'),
  ('Titanic',                'Romance',           'Amor proibido a bordo de um navio condenado'),
  ('Matrix',                 'Ação',              'A realidade é uma simulação'),
  ('Divertida Mente',        'Animação',          'As emoções de uma garota ganham vida'),
  ('Coringa',                'Drama',             'A origem sombria de um vilão icônico');

-- Séries
INSERT INTO series (nome, temporadas, genero, descricao) VALUES
  ('Breaking Bad',     5, 'Drama',            'Professor vira traficante de drogas'),
  ('Stranger Things',  4, 'Ficção Científica','Crianças enfrentam forças do outro mundo'),
  ('Game of Thrones',  8, 'Fantasia',         'Luta pelo trono dos Sete Reinos'),
  ('The Office',       9, 'Comédia',          'A rotina de um escritório americano'),
  ('Friends',         10, 'Comédia',          'Seis amigos em Nova York'),
  ('The Crown',        6, 'Drama',            'A história da família real britânica'),
  ('Sherlock',         4, 'Mistério',         'Detetive moderno em Londres'),
  ('Dark',             3, 'Ficção Científica','Viagens no tempo e seus paradoxos'),
  ('Lupin',            3, 'Suspense',         'Um ladrão inspirado por Arsène Lupin'),
  ('La Casa de Papel', 5, 'Ação',             'Assaltos planejados à perfeição');

-- Avaliações de filmes
INSERT INTO avaliacoes_filmes (id, usuario_id, filme_id, nota, comentario) VALUES
  (1, 1, 1, 4.5, 'Excelente filme!'),
  (2, 2, 3, 3.0, 'Poderia ser melhor'),
  (3, 3, 5, 5.0, 'Obra-prima'),
  (4, 4, 2, 4.0, 'Muito bom!'),
  (5, 5, 4, 2.5, 'Não gostei tanto'),
  (6, 6, 6, 4.8, 'Incrível!'),
  (7, 7, 7, 3.5, 'Regular'),
  (8, 8, 8, 5.0, 'Maravilhoso'),
  (9, 9, 9, 1.0, 'Péssimo'),
  (10,10,10,4.2,'Gostei bastante');

-- Avaliações de séries
INSERT INTO avaliacoes_series (id, usuario_id, serie_id, nota, comentario) VALUES
  (1, 1, 1, 4.5, 'Excelente filme!'),
  (2, 2, 3, 3.0, 'Poderia ser melhor'),
  (3, 3, 4, 5.0, 'Obra-prima'),
  (4, 4, 2, 4.0, 'Muito bom!'),
  (5, 5, 5, 2.5, 'Não gostei tanto'),
  (6, 6, 6, 4.8, 'Incrível!'),
  (7, 7, 7, 3.5, 'Regular'),
  (8, 8, 8, 5.0, 'Maravilhoso'),
  (9, 9, 9, 1.0, 'Péssimo'),
  (10,10,10,4.2,'Gostei bastante');

-- Favoritos de avaliações de filmes
INSERT INTO favoritos_filmes (usuario_id, avaliacao_filme_id) VALUES
  (2,1),(3,2),(4,3),(5,4),(6,5),
  (7,6),(8,7),(9,8),(10,9),(1,10);

-- Favoritos de avaliações de séries
INSERT INTO favoritos_series (usuario_id, avaliacao_serie_id) VALUES
  (2,1),(3,2),(4,3),(5,4),(6,5),
  (7,6),(8,7),(9,8),(10,9),(1,10);

-- Consultas

-- Consulta 1: avaliações de filmes pelo usuário 'Diego Lima'
SELECT
  u.nome    AS usuario,
  f.nome    AS filme,
  af.nota,
  af.comentario
FROM avaliacoes_filmes af
JOIN usuarios u ON af.usuario_id = u.id
JOIN filmes f   ON af.filme_id   = f.id
WHERE u.nome = 'Diego Lima';

-- Consulta 2: favoritos de avaliações de séries com nota ≥ 4.0
SELECT
  u.nome    AS usuario,
  s.nome    AS serie,
  asr.nota
FROM favoritos_series fav
JOIN avaliacoes_series asr ON fav.avaliacao_serie_id = asr.id
JOIN series s               ON asr.serie_id          = s.id
JOIN usuarios u             ON fav.usuario_id        = u.id
WHERE asr.nota >= 4.0;

-- Consulta 3: média e quantidade de avaliações por filme (média > 3.5)
SELECT
  f.nome               AS filme,
  AVG(af.nota)         AS media_nota,
  COUNT(af.id)         AS qtd_avaliacoes
FROM filmes f
JOIN avaliacoes_filmes af ON f.id = af.filme_id
GROUP BY f.nome
HAVING AVG(af.nota) > 3.5
ORDER BY AVG(af.nota) DESC;

-- Consulta 4: total de avaliações (filmes + séries) por usuário (>1)
SELECT
  u.nome                                   AS usuario,
  (COALESCE(filmes_qtd,0) + COALESCE(series_qtd,0)) AS total_avaliacoes
FROM usuarios u
LEFT JOIN (
  SELECT usuario_id, COUNT(*) AS filmes_qtd
  FROM avaliacoes_filmes
  GROUP BY usuario_id
) fm ON u.id = fm.usuario_id
LEFT JOIN (
  SELECT usuario_id, COUNT(*) AS series_qtd
  FROM avaliacoes_series
  GROUP BY usuario_id
) ss ON u.id = ss.usuario_id
WHERE (COALESCE(fm.filmes_qtd,0) + COALESCE(ss.series_qtd,0)) > 1
ORDER BY total_avaliacoes DESC;