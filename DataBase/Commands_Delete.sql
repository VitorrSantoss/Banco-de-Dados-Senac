-- =========================================================
-- COMANDOS DML - DELETE (Excluir)
-- =========================================================

-- 15. Excluir uma venda específica
DELETE FROM `loja_roupas`.`tb_vendas` WHERE `id_venda` = 1;

-- 16. Excluir um produto específico (CUIDADO com as chaves estrangeiras)
-- Como 'tb_vendas' e 'tb_produto_tamanho' e 'tb_produto_cor' fazem referência,
-- primeiro é preciso excluir os registros dessas tabelas relacionados a ele.
DELETE FROM `loja_roupas`.`tb_produto_tamanho`
WHERE
    `tb_produtos_id_produto` = 3;

DELETE FROM `loja_roupas`.`tb_produto_cor`
WHERE
    `tb_produtos_id_produto` = 3;

-- 17. Excluir um funcionário específico
DELETE FROM `loja_roupas`.`tb_funcionario`
WHERE
    `id_funcionario` = 2;

-- 18. Excluir uma categoria de produto
-- Primeiro, é preciso atualizar os produtos que usam essa categoria, para que a exclusão funcione.
UPDATE `loja_roupas`.`tb_produtos`
SET
    `tb_categoria_produto_id_categoria` = 2
WHERE
    `tb_categoria_produto_id_categoria` = 4;

DELETE FROM `loja_roupas`.`tb_categoria_produto`
WHERE
    `id_categoria` = 4;

-- 19. Excluir um fornecedor específico
-- Primeiro, é preciso atualizar os produtos que usam esse fornecedor, para que a exclusão funcione.
UPDATE `loja_roupas`.`tb_produtos`
SET
    `tb_fornecedor_id_fornecedor` = 1
WHERE
    `tb_fornecedor_id_fornecedor` = 2;

DELETE FROM `loja_roupas`.`tb_fornecedor` WHERE `id_fornecedor` = 2;

-- 20. Excluir uma marca (CUIDADO com as chaves estrangeiras)
-- Primeiro, atualize os produtos para usarem outra marca
UPDATE `loja_roupas`.`tb_produtos`
SET
    `tb_marca_id_marca` = 1
WHERE
    `tb_marca_id_marca` = 3;

DELETE FROM `loja_roupas`.`tb_marca` WHERE `id_marca` = 3;