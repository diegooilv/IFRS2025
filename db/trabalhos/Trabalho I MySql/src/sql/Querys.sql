-- Consulta 1: Mostra as avaliações feitas por um usuário específico, com os nomes dos filmes avaliados
SELECT 
  u.nome AS usuario,
  f.nome AS filme,
  a.nota,
  a.comentario
FROM Avaliação a
JOIN Usuario u ON a.Usuario_idUsuario = u.idUsuario
JOIN Avaliação_has_Filme af ON a.idAvaliação = af.Avaliação_idAvaliação
JOIN Filme f ON af.Filme_idFilme = f.idFilme
WHERE u.nome = 'Diego Lima';

-- Consulta 2: Lista os favoritos de cada usuário com a nota da avaliação e o nome da série associada
SELECT 
  u.nome AS usuario,
  s.nome AS serie,
  a.nota
FROM Favorito fav
JOIN Avaliação a ON fav.Avaliação_idAvaliação = a.idAvaliação
JOIN Avaliação_has_Serie ahs ON a.idAvaliação = ahs.Avaliação_idAvaliação
JOIN Serie s ON ahs.Serie_idSerie = s.idSerie
JOIN Usuario u ON fav.Usuario_idUsuario = u.idUsuario
WHERE a.nota >= 4.0;

-- Consulta 3: Agrupa as avaliações por filme e mostra a média das notas, exibindo apenas filmes com média acima de 3.5, ordenado do maior para o menor
SELECT 
  f.nome AS filme,
  AVG(a.nota) AS media_nota,
  COUNT(a.idAvaliação) AS qtd_avaliacoes
FROM Filme f
JOIN Avaliação_has_Filme af ON f.idFilme = af.Filme_idFilme
JOIN Avaliação a ON af.Avaliação_idAvaliação = a.idAvaliação
GROUP BY f.nome
HAVING media_nota > 3.5
ORDER BY media_nota DESC;

-- Consulta 4: Conta quantas avaliações cada usuário fez, exibindo apenas quem fez mais de 1 avaliação
SELECT 
  u.nome AS usuario,
  COUNT(a.idAvaliação) AS total_avaliacoes
FROM Usuario u
JOIN Avaliação a ON u.idUsuario = a.Usuario_idUsuario
GROUP BY u.nome
HAVING total_avaliacoes > 1
ORDER BY total_avaliacoes DESC;
