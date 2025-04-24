-- Inserts na tabela Usuario
INSERT INTO Usuario (nome, email, senha) VALUES
('Diego Lima', 'diego@example.com', 'senha123'),
('Ana Souza', 'ana@example.com', 'senha456'),
('Carlos Mendes', 'carlos@example.com', 'abc123'),
('Lúcia Ferreira', 'lucia@example.com', 'minhasenha'),
('Pedro Gomes', 'pedro@example.com', '123senha'),
('Juliana Rocha', 'juliana@example.com', 'jurocha22'),
('Rafael Silva', 'rafael@example.com', 'pass987'),
('Bianca Costa', 'bianca@example.com', 'senha@bi'),
('Tiago Martins', 'tiago@example.com', 'martins2025'),
('Laura Dias', 'laura@example.com', 'ldias#321');

-- Inserts na tabela Filme
INSERT INTO Filme (nome, genero, descrição) VALUES
('A Origem', 'Ficção Científica', 'Um ladrão de sonhos em realidades paralelas'),
('O Poderoso Chefão', 'Drama', 'A saga de uma família mafiosa'),
('Vingadores: Ultimato', 'Ação', 'Heróis enfrentam Thanos'),
('Parasita', 'Suspense', 'Família pobre se infiltra na casa de ricos'),
('O Rei Leão', 'Animação', 'O ciclo da vida na savana africana'),
('Interestelar', 'Ficção Científica', 'Viagem no espaço e tempo para salvar a humanidade'),
('Titanic', 'Romance', 'Amor proibido a bordo de um navio condenado'),
('Matrix', 'Ação', 'A realidade é uma simulação'),
('Divertida Mente', 'Animação', 'As emoções de uma garota ganham vida'),
('Coringa', 'Drama', 'A origem sombria de um vilão icônico');

-- Inserts na tabela Serie
INSERT INTO Serie (nome, temporadas, genero, descrição) VALUES
('Breaking Bad', 5, 'Drama', 'Professor vira traficante de drogas'),
('Stranger Things', 4, 'Ficção Científica', 'Crianças enfrentam forças do outro mundo'),
('Game of Thrones', 8, 'Fantasia', 'Luta pelo trono dos Sete Reinos'),
('The Office', 9, 'Comédia', 'A rotina de um escritório americano'),
('Friends', 10, 'Comédia', 'Seis amigos em Nova York'),
('The Crown', 6, 'Drama', 'A história da família real britânica'),
('Sherlock', 4, 'Mistério', 'Detetive moderno em Londres'),
('Dark', 3, 'Ficção Científica', 'Viagens no tempo e seus paradoxos'),
('Lupin', 3, 'Suspense', 'Um ladrão inspirado por Arsène Lupin'),
('La Casa de Papel', 5, 'Ação', 'Assaltos planejados à perfeição');

-- Inserts na tabela Avaliação
INSERT INTO Avaliação (nota, comentario, Usuario_idUsuario) VALUES
(4.5, 'Excelente filme!', 1),
(3.0, 'Poderia ser melhor', 2),
(5.0, 'Obra-prima', 3),
(4.0, 'Muito bom!', 4),
(2.5, 'Não gostei tanto', 5),
(4.8, 'Incrível!', 6),
(3.5, 'Regular', 7),
(5.0, 'Maravilhoso', 8),
(1.0, 'Péssimo', 9),
(4.2, 'Gostei bastante', 10);

-- Inserts na tabela Avaliação_has_Filme
INSERT INTO Avaliação_has_Filme (Avaliação_idAvaliação, Filme_idFilme) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 4),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserts na tabela Avaliação_has_Serie
INSERT INTO Avaliação_has_Serie (Avaliação_idAvaliação, Serie_idSerie) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserts na tabela Favorito
INSERT INTO Favorito (Avaliação_idAvaliação, Usuario_idUsuario) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);
