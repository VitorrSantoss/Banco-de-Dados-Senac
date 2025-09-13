-- =========================================================
-- COMANDOS DML - UPDATE (Atualizar)
-- =========================================================.

-- 1. Atualiza o email de um cliente específico.
UPDATE `loja_roupas`.`tb_clientes`
SET `email` = 'bruno.novosilva@email.com'
WHERE `id_cliente` = 2;

-- 2. Aumenta o preço de todos os produtos da categoria 'Calçados' (ID 4) em 10%.
UPDATE `loja_roupas`.`tb_produtos`
SET `preco` = `preco` * 1.10
WHERE `tb_categoria_produto_id_categoria` = 4;

-- 3. Atualiza o cargo de um funcionário.
UPDATE `loja_roupas`.`tb_funcionario`
SET `cargo` = 'Coordenador de Vendas'
WHERE `id_funcionario` = 1;

-- 4. Atualiza a quantidade em estoque de um produto específico.
UPDATE `loja_roupas`.`tb_estoque`
SET `qtd_disponivel` = 250
WHERE `id_estoque` = 16;

-- 5. Atualiza o telefone de um fornecedor.
UPDATE `loja_roupas`.`tb_fornecedor`
SET `telefone` = '999998888'
WHERE `id_fornecedor` = 1;

-- 6. Muda o status de uma promoção para 'Expirada'.
UPDATE `loja_roupas`.`tb_promocao`
SET `status` = 'Expirada'
WHERE `id_promocao` = 1;

-- 7. Atualiza a data de uma venda específica.
UPDATE `loja_roupas`.`tb_vendas`
SET `data_venda` = '2025-09-13'
WHERE `id_venda` = 1;

-- 8. Corrige o nome de uma categoria de produto.
UPDATE `loja_roupas`.`tb_categoria_produto`
SET `nome` = 'Roupas de Ginástica'
WHERE `id_categoria` = 8;

-- 9. Atualiza o nome de uma cor.
UPDATE `loja_roupas`.`tb_cores`
SET `nome` = 'Amarelo Ouro'
WHERE `id_cor` = 6;

-- 10. Aplica a promoção 'Black Friday' (ID 2) a um produto específico.
UPDATE `loja_roupas`.`tb_produto_promocao`
SET `tb_promocao_id_promocao` = 2
WHERE `tb_produtos_id_produto` = 20;

-- 11. Altera o endereço de um cliente.
UPDATE `loja_roupas`.`tb_clientes`
SET `endereco` = 'Avenida do Oceano, 500'
WHERE `id_cliente` = 5;

-- 12. Diminui o preço de produtos da marca 'Levis' (ID 10) em 10%.
UPDATE `loja_roupas`.`tb_produtos`
SET `preco` = `preco` * 0.90
WHERE `tb_marca_id_marca` = 10;

-- 13. Atualiza a descrição de um produto.
UPDATE `loja_roupas`.`tb_produtos`
SET `descricao` = 'Tecido leve e respirável'
WHERE `id_produto` = 1;

-- 14. Muda o contato de um funcionário.
UPDATE `loja_roupas`.`tb_funcionario`
SET `contato` = 'novo.contato@email.com'
WHERE `id_funcionario` = 3;