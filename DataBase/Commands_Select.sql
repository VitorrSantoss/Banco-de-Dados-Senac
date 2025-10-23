-- =========================================================
-- Scripts DQL - SELECT (Selecionar)
-- =========================================================

-- 1. Relatório de Vendas por Funcionário:
-- Quantas vendas cada funcionário realizou e qual o valor total de suas vendas?
SELECT
    f.nome AS NomeFuncionario,
    COUNT(v.id_venda) AS TotalVendas,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ValorTotalVendas
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.nome
ORDER BY 
    SUM(p.preco) DESC; -- Continua ordenando pelo valor numérico real, não pela string formatada

-- 2. Produtos Mais Vendidos:
-- Quais são os 5 produtos mais vendidos, ordenados pela quantidade total de vendas?
SELECT
    p.nome AS NomeProduto,
    COUNT(v.id_venda) AS QuantidadeVendida
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.nome
ORDER BY QuantidadeVendida DESC
LIMIT 5;

-- 3. Desempenho por Categoria:
-- Qual a receita total gerada por cada categoria de produto?
SELECT
    c.nome AS NomeCategoria,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome
ORDER BY
    SUM(p.preco) DESC; -- Continua ordenando pelo valor numérico real (SUM(p.preco))

-- 4. Clientes Mais Frequentes:
-- Quais são os clientes que realizaram o maior número de compras?
SELECT
    c.nome AS NomeCliente,
    COUNT(v.id_venda) AS NumeroDeCompras
FROM tb_vendas AS v
    JOIN tb_clientes AS c ON v.tb_clientes_id_cliente = c.id_cliente
GROUP BY
    c.nome
ORDER BY NumeroDeCompras DESC;

-- 5. Análise de Preço por Categoria:
-- Qual o preço médio dos produtos em cada categoria?
SELECT
    c.nome AS NomeCategoria,
    CONCAT('R$ ', FORMAT(AVG(p.preco), 2, 'de_DE')) AS PrecoMedio
FROM
    tb_produtos AS p
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome;

-- 6. Fornecedores e Produtos:
-- Listar todos os produtos fornecidos por um fornecedor específico.
SELECT
    p.nome AS NomeProduto,
    p.preco,
    f.cnpj AS CnpjFornecedor
FROM
    tb_produtos AS p
    JOIN tb_fornecedor AS f ON p.tb_fornecedor_id_fornecedor = f.id_fornecedor;

-- 7. Ticket Médio:
-- Qual o valor médio de uma venda (o "ticket médio")?
SELECT
    CONCAT('R$ ', FORMAT(AVG(p.preco), 2, 'de_DE')) AS TicketMedio
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto;

-- 8. Vendas por Marca:
-- Qual o desempenho de vendas de cada marca?
SELECT m.nome AS NomeMarca, COUNT(v.id_venda) AS TotalVendas
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_marca AS m ON p.tb_marca_id_marca = m.id_marca
GROUP BY
    m.nome
ORDER BY TotalVendas DESC;

-- 9. Vendas por Tamanho:
-- Quais são os tamanhos de produtos mais populares em vendas?
SELECT p.tamanho AS Tamanho, COUNT(v.id_venda) AS TotalVendas
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.tamanho
ORDER BY TotalVendas DESC;

-- 10. Produtos Acima da Média:
-- Listar todos os produtos cujo preço é superior ao preço médio de todos os produtos.
SELECT
    nome AS NomeProduto,
    CONCAT('R$ ', FORMAT(preco, 2, 'de_DE')) AS Preco
FROM
    tb_produtos
WHERE
    preco > (
        SELECT AVG(preco)
        FROM tb_produtos
    );

-- 11. Vendas por Cargo de Funcionário:
-- Qual a receita total gerada por cada cargo (ex: Vendedor, Gerente)?
SELECT
    f.cargo,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaPorCargo
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.cargo
ORDER BY
    SUM(p.preco) DESC;

-- 12. Relatório de Clientes e Compras:
-- Listar o nome de cada cliente e o número total de compras que eles realizaram.
SELECT c.nome AS NomeCliente, COUNT(v.id_venda) AS TotalCompras
FROM tb_clientes AS c
    LEFT JOIN tb_vendas AS v ON c.id_cliente = v.tb_clientes_id_cliente
GROUP BY
    c.nome
ORDER BY TotalCompras DESC;

-- 13. Produtos Com Desconto:
-- Quais produtos estão em promoção e qual o valor do desconto?
SELECT
    p.nome AS NomeProduto,
    pr.nome AS NomePromocao,
    CONCAT(pr.valo_desconto, '%') AS ValorDesconto
FROM
    tb_produtos AS p
    JOIN tb_produto_promocao AS pp ON p.id_produto = pp.tb_produtos_id_produto
    JOIN tb_promocao AS pr ON pp.tb_promocao_id_promocao = pr.id_promocao;

-- 14. Total de Produtos por Fornecedor:
-- Quantos produtos cada fornecedor tem cadastrado no banco de dados?
SELECT f.cnpj AS Fornecedor, COUNT(p.id_produto) AS TotalProdutos
FROM
    tb_fornecedor AS f
    JOIN tb_produtos AS p ON f.id_fornecedor = p.tb_fornecedor_id_fornecedor
GROUP BY
    f.cnpj
ORDER BY TotalProdutos DESC;

-- 15. Vendas por Fornecedor:
-- Qual o valor total de vendas de produtos fornecidos por cada fornecedor?
SELECT
    f.cnpj AS Fornecedor,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_fornecedor AS f ON p.tb_fornecedor_id_fornecedor = f.id_fornecedor
GROUP BY
    f.cnpj
ORDER BY
    SUM(p.preco) DESC;

-- 16. Tempo de Estadia no Estoque:
-- Qual o tempo médio de um produto no estoque antes de ser vendido?
SELECT AVG(
        DATEDIFF(v.data_venda, e.data_entrada)
    ) AS DiasMediosNoEstoque
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_estoque AS e ON p.tb_estoque_id_estoque = e.id_estoque;

-- 17. Vendas por Cor:
-- Qual a receita total gerada por cada cor de produto?
SELECT
    p.cor AS CorProduto,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.cor
ORDER BY
    SUM(p.preco) DESC;

-- 18. Vendas por Categoria e Tamanho:
-- Qual a quantidade de produtos vendidos por categoria e tamanho?
SELECT
    c.nome AS NomeCategoria,
    p.tamanho AS Tamanho,
    COUNT(v.id_venda) AS QuantidadeVendida
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome,
    p.tamanho
ORDER BY QuantidadeVendida DESC;

-- 19. Vendas por Vendedor e Categoria:
-- Qual a receita total gerada por cada funcionário em cada categoria de produto?
SELECT
    f.nome AS NomeVendedor,
    c.nome AS NomeCategoria,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    f.nome,
    c.nome
ORDER BY
    f.nome,
    SUM(p.preco) DESC;

-- 20. Receita Total por Ano e Marca:
-- Qual a receita total gerada por cada marca, agrupada por ano?
SELECT
    YEAR(v.data_venda) AS Ano,
    m.nome AS NomeMarca,
    CONCAT('R$ ', FORMAT(SUM(p.preco), 2, 'de_DE')) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_marca AS m ON p.tb_marca_id_marca = m.id_marca
GROUP BY
    Ano,
    NomeMarca
ORDER BY
    Ano DESC,
    SUM(p.preco) DESC; -- Ordenação pela soma numérica para garantir a ordem correta
