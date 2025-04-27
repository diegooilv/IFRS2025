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