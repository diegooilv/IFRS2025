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