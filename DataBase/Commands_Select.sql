-- =========================================================
-- Scripts DQL - SELECT (Selecionar)
-- =========================================================

-- 1. Relatório de Vendas por Funcionário:
-- Quantas vendas cada funcionário realizou e qual o valor total de suas vendas?
-- Usa JOIN para conectar 'tb_vendas', 'tb_funcionario' e 'tb_produtos'.
SELECT
    f.nome AS NomeFuncionario,
    COUNT(v.id_venda) AS TotalVendas,
    SUM(p.preco) AS ValorTotalVendas
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.nome
ORDER BY ValorTotalVendas DESC;

-- 2. Produtos Mais Vendidos:
-- Quais são os 5 produtos mais vendidos, ordenados pela quantidade total de vendas?
-- Usa JOIN para conectar 'tb_vendas' e 'tb_produtos'.
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
-- Usa JOIN para conectar 'tb_vendas', 'tb_produtos' e 'tb_categoria_produto'.
SELECT c.nome AS NomeCategoria, SUM(p.preco) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome
ORDER BY ReceitaTotal DESC;

-- 4. Clientes Mais Frequentes:
-- Quais são os clientes que realizaram o maior número de compras?
-- Usa JOIN para conectar 'tb_vendas' e 'tb_clientes'.
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
-- Usa JOIN para conectar 'tb_produtos' e 'tb_categoria_produto'.
SELECT c.nome AS NomeCategoria, AVG(p.preco) AS PrecoMedio
FROM
    tb_produtos AS p
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome;

-- 6. Fornecedores e Produtos:
-- Listar todos os produtos fornecidos por um fornecedor específico.
-- Usa JOIN para conectar 'tb_produtos' e 'tb_fornecedor'.
SELECT
    p.nome AS NomeProduto,
    p.preco,
    f.cnpj AS CnpjFornecedor
FROM
    tb_produtos AS p
    JOIN tb_fornecedor AS f ON p.tb_fornecedor_id_fornecedor = f.id_fornecedor
WHERE
    f.cnpj = '12.345.678/0001-90';

-- 7. Ticket Médio:
-- Qual o valor médio de uma venda (o "ticket médio")?
SELECT AVG(p.preco) AS TicketMedio
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto;

-- 8. Vendas por Marca:
-- Qual o desempenho de vendas de cada marca?
-- Usa JOIN para conectar 'tb_vendas', 'tb_produtos' e 'tb_marca'.
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
-- Usa JOIN para conectar 'tb_vendas' e 'tb_produtos'.
SELECT p.tamanho AS Tamanho, COUNT(v.id_venda) AS TotalVendas
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.tamanho
ORDER BY TotalVendas DESC;

-- 10. Produtos Acima da Média:
-- Listar todos os produtos cujo preço é superior ao preço médio de todos os produtos.
-- Usa subselect para calcular o preço médio.
SELECT nome AS NomeProduto, preco
FROM tb_produtos
WHERE
    preco > (
        SELECT AVG(preco)
        FROM tb_produtos
    );

-- 11. Vendas por Cargo de Funcionário:
-- Qual a receita total gerada por cada cargo (ex: Vendedor, Gerente)?
-- Usa JOIN para conectar 'tb_vendas', 'tb_funcionario' e 'tb_produtos'.
SELECT f.cargo, SUM(p.preco) AS ReceitaPorCargo
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.cargo
ORDER BY ReceitaPorCargo DESC;

-- 12. Relatório de Clientes e Compras:
-- Listar o nome de cada cliente e o número total de compras que eles realizaram.
-- Usa JOIN para conectar 'tb_clientes' e 'tb_vendas'.
SELECT c.nome AS NomeCliente, COUNT(v.id_venda) AS TotalCompras
FROM tb_clientes AS c
    LEFT JOIN tb_vendas AS v ON c.id_cliente = v.tb_clientes_id_cliente
GROUP BY
    c.nome
ORDER BY TotalCompras DESC;

-- 13. Produtos Com Desconto:
-- Quais produtos estão em promoção e qual o valor do desconto?
-- Nota: Esta query é um exemplo e depende da tabela 'tb_promocao'
-- e da forma como o desconto é calculado.
SELECT
    p.nome AS NomeProduto,
    pr.nome AS NomePromocao,
    pr.valo_desconto AS ValorDesconto
FROM
    tb_produtos AS p
    JOIN tb_produto_promocao AS pp ON p.id_produto = pp.tb_produtos_id_produto
    JOIN tb_promocao AS pr ON pp.tb_promocao_id_promocao = pr.id_promocao;

-- 14. Total de Produtos por Fornecedor:
-- Quantos produtos cada fornecedor tem cadastrado no banco de dados?
-- Usa JOIN para conectar 'tb_produtos' e 'tb_fornecedor'.
SELECT f.cnpj AS Fornecedor, COUNT(p.id_produto) AS TotalProdutos
FROM
    tb_fornecedor AS f
    JOIN tb_produtos AS p ON f.id_fornecedor = p.tb_fornecedor_id_fornecedor
GROUP BY
    f.cnpj
ORDER BY TotalProdutos DESC;

-- 15. Vendas por Fornecedor:
-- Qual o valor total de vendas de produtos fornecidos por cada fornecedor?
-- Usa JOIN para conectar 'tb_vendas', 'tb_produtos' e 'tb_fornecedor'.
SELECT f.cnpj AS Fornecedor, SUM(p.preco) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_fornecedor AS f ON p.tb_fornecedor_id_fornecedor = f.id_fornecedor
GROUP BY
    f.cnpj
ORDER BY ReceitaTotal DESC;

-- 16. Tempo de Estadia no Estoque:
-- Qual o tempo médio de um produto no estoque antes de ser vendido?
-- Usa JOIN para conectar 'tb_vendas' e 'tb_estoque', e DATEDIFF para calcular a diferença de datas.
SELECT AVG(
        DATEDIFF(v.data_venda, e.data_entrada)
    ) AS DiasMediosNoEstoque
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_estoque AS e ON p.tb_estoque_id_estoque = e.id_estoque;

-- 17. Vendas por Cor:
-- Qual a receita total gerada por cada cor de produto?
-- Usa JOIN para conectar 'tb_vendas' e 'tb_produtos'.
SELECT p.cor AS CorProduto, SUM(p.preco) AS ReceitaTotal
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.cor
ORDER BY ReceitaTotal DESC;

-- 18. Vendas por Categoria e Tamanho:
-- Qual a quantidade de produtos vendidos por categoria e tamanho?
-- Usa JOIN para conectar 'tb_vendas', 'tb_produtos' e 'tb_categoria_produto'.
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
-- Usa JOIN para conectar 'tb_vendas', 'tb_funcionario', 'tb_produtos' e 'tb_categoria_produto'.
SELECT
    f.nome AS NomeVendedor,
    c.nome AS NomeCategoria,
    SUM(p.preco) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    f.nome,
    c.nome
ORDER BY f.nome, ReceitaTotal DESC;

-- 20. Receita Total por Ano e Marca:
-- Qual a receita total gerada por cada marca, agrupada por ano?
-- Usa JOIN para conectar 'tb_vendas', 'tb_produtos' e 'tb_marca'.
SELECT
    YEAR(v.data_venda) AS Ano,
    m.nome AS NomeMarca,
    SUM(p.preco) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_marca AS m ON p.tb_marca_id_marca = m.id_marca
GROUP BY
    Ano,
    NomeMarca
ORDER BY Ano DESC, ReceitaTotal DESC;