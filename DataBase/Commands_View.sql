-- =========================================================
-- Scripts DDL (Data Definition Language) para criar Views
-- As views simplificam consultas complexas, agindo como tabelas virtuais.
-- =========================================================

-- Para garantir que o script possa ser executado múltiplas vezes,
-- primeiro removemos as views se elas já existirem.
DROP VIEW IF EXISTS v_relatorio_vendas_por_funcionario;

DROP VIEW IF EXISTS v_produtos_mais_vendidos;

DROP VIEW IF EXISTS v_receita_por_categoria;

DROP VIEW IF EXISTS v_clientes_mais_frequentes;

DROP VIEW IF EXISTS v_preco_medio_por_categoria;

DROP VIEW IF EXISTS v_produtos_em_estoque_baixo;

DROP VIEW IF EXISTS v_vendas_por_mes;

DROP VIEW IF EXISTS v_receita_por_cargo;

DROP VIEW IF EXISTS v_total_produtos_por_fornecedor;

DROP VIEW IF EXISTS v_receita_por_ano_e_marca;

-- 1. View para Relatório de Vendas por Funcionário
-- Mostra o total de vendas e a receita total por funcionário.
CREATE VIEW v_relatorio_vendas_por_funcionario AS
SELECT
    f.nome AS NomeFuncionario,
    COUNT(v.id_venda) AS TotalVendas,
    SUM(p.preco) AS ValorTotalVendas
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.nome;

-- 2. View para os Produtos Mais Vendidos
-- Lista os produtos e a quantidade de vezes que foram vendidos.
CREATE VIEW v_produtos_mais_vendidos AS
SELECT
    p.nome AS NomeProduto,
    COUNT(v.id_venda) AS QuantidadeVendida
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    p.nome;

-- 3. View para o Desempenho de Receita por Categoria
-- Calcula a receita total gerada por cada categoria de produto.
CREATE VIEW v_receita_por_categoria AS
SELECT c.nome AS NomeCategoria, SUM(p.preco) AS ReceitaTotal
FROM
    tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome;

-- 4. View para Clientes Mais Frequentes
-- Identifica os clientes que realizaram o maior número de compras.
CREATE VIEW v_clientes_mais_frequentes AS
SELECT
    c.nome AS NomeCliente,
    COUNT(v.id_venda) AS NumeroDeCompras
FROM tb_vendas AS v
    JOIN tb_clientes AS c ON v.tb_clientes_id_cliente = c.id_cliente
GROUP BY
    c.nome;

-- 5. View para Análise de Preço Médio por Categoria
-- Mostra o preço médio dos produtos em cada categoria.
CREATE VIEW v_preco_medio_por_categoria AS
SELECT c.nome AS NomeCategoria, AVG(p.preco) AS PrecoMedio
FROM
    tb_produtos AS p
    JOIN tb_categoria_produto AS c ON p.tb_categoria_produto_id_categoria = c.id_categoria
GROUP BY
    c.nome;

-- 6. View para Estoque Baixo
-- Lista produtos com quantidade em estoque abaixo de 20 unidades.
CREATE VIEW v_produtos_em_estoque_baixo AS
SELECT
    p.nome AS NomeProduto,
    e.qtd_disponivel AS QuantidadeEstoque
FROM tb_produtos AS p
    JOIN tb_estoque AS e ON p.tb_estoque_id_estoque = e.id_estoque
WHERE
    e.qtd_disponivel < 20;

-- 7. View para Vendas por Mês
-- Calcula o total de vendas realizadas em cada mês do ano.
CREATE VIEW v_vendas_por_mes AS
SELECT YEAR(data_venda) AS Ano, MONTH(data_venda) AS Mes, SUM(p.preco) AS TotalVendas
FROM tb_vendas AS v
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    Ano,
    Mes;

-- 8. View para Receita por Cargo
-- Mostra a receita total gerada por cada cargo de funcionário.
CREATE VIEW v_receita_por_cargo AS
SELECT f.cargo, SUM(p.preco) AS ReceitaPorCargo
FROM
    tb_vendas AS v
    JOIN tb_funcionario AS f ON v.tb_funcionario_id_funcionario = f.id_funcionario
    JOIN tb_produtos AS p ON v.tb_produtos_id = p.id_produto
GROUP BY
    f.cargo;

-- 9. View para Total de Produtos por Fornecedor
-- Conta o número de produtos fornecidos por cada fornecedor.
CREATE VIEW v_total_produtos_por_fornecedor AS
SELECT f.cnpj AS Fornecedor, COUNT(p.id_produto) AS TotalProdutos
FROM
    tb_fornecedor AS f
    JOIN tb_produtos AS p ON f.id_fornecedor = p.tb_fornecedor_id_fornecedor
GROUP BY
    f.cnpj;

-- 10. View para Receita por Ano e Marca
-- Mostra a receita total gerada por cada marca, agrupada por ano.
CREATE VIEW v_receita_por_ano_e_marca AS
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
    NomeMarca;