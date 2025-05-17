--- 1
SELECT 
  j.nome   AS jogador, 
  t.nome   AS equipe
FROM 
  "Jogador" j
  JOIN "Time" t ON j.codTime = t.codTime
WHERE 
  t.sigla = 'TQO';

--- 2
SELECT
  t.nome         AS equipe,
  tor.nome       AS torneio,
  p.posicao      AS colocacao
FROM
  "Participacao" p
  JOIN "Time"      t   ON p.codTime    = t.codTime
  JOIN "Torneio"   tor ON p.codTorneio = tor.codTorneio
WHERE
  EXTRACT(YEAR FROM tor.data) = 2024;


--- 3
SELECT
  t.nome               AS equipe_mandante,
  COUNT(*)             AS partidas_com_2mais_pontos
FROM
  "Jogo" j
  JOIN "Time" t ON j.codTimeMandante = t.codTime
WHERE
  j.ptsTimeMandante > 2
GROUP BY
  t.nome
HAVING
  COUNT(*) >= 2
ORDER BY
  partidas_com_2mais_pontos DESC;

--- 4
SELECT
  t.codTime,
  t.nome,
  ROUND(AVG(total_pts),2) AS media_pontos
FROM (
  -- soma dos pontos como mandante
  SELECT 
    codTimeMandante AS codTime,
    ptsTimeMandante + 0 AS total_pts
  FROM "Jogo"
  UNION ALL
  -- soma dos pontos como visitante
  SELECT
    codTimeVisitante AS codTime,
    ptsTimeVisitante + 0 AS total_pts
  FROM "Jogo"
) AS all_pts
JOIN "Time" t ON all_pts.codTime = t.codTime
GROUP BY
  t.codTime, t.nome
ORDER BY
  media_pontos DESC
LIMIT 5;
