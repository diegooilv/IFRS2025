-- Questão 8
SELECT Clientes.Nome, Clientes.Cidade, Pedidos.Data
FROM Pedidos
INNER JOIN Clientes ON Pedidos.IdCliente = Clientes.IdCliente;

-- Questão 9
SELECT codigo_item, nome_item, preco_item
FROM itens
WHERE preco_item > 10.20;

-- Questão 10
SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM livros AS l
INNER JOIN autores AS a ON l.autor_id = a.id
INNER JOIN categorias AS c ON l.categoria_id = c.id
WHERE l.disponivel = TRUE
AND c.nome = 'Ficção Científica';