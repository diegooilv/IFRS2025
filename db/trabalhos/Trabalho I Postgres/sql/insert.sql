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