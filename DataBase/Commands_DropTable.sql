-- =========================================================
-- COMANDOS DDL - DROP (Destruir)
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

-- Exclui a tabela de vendas primeiro, pois ela possui chaves estrangeiras
DROP TABLE IF EXISTS `loja_roupas`.`tb_vendas`;

-- Exclui as tabelas de junção, que dependem das tabelas principais
DROP TABLE IF EXISTS `loja_roupas`.`tb_produto_tamanho`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_produto_cor`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_produto_promocao`;

-- Exclui a tabela de produtos, que depende de várias tabelas
DROP TABLE IF EXISTS `loja_roupas`.`tb_produtos`;

-- Exclui as tabelas principais, que não possuem dependências de outras tabelas além de si mesmas
DROP TABLE IF EXISTS `loja_roupas`.`tb_categoria_produto`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_clientes`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_estoque`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_fornecedor`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_funcionario`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_marca`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_tamanho`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_cores`;

DROP TABLE IF EXISTS `loja_roupas`.`tb_promocao`;

-- Se você criou a tabela de endereços, ela também precisa ser excluída
DROP TABLE IF EXISTS `loja_roupas`.`tb_endereco_fornecedor`;

-- Se você tiver alguma view, ela pode ser excluída aqui
-- Exemplo: DROP VIEW IF EXISTS `loja_roupas`.`nome_da_sua_view`;

-- Reativa a verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;

-- Opcional: Exclui o próprio esquema (banco de dados)
-- DROP SCHEMA IF EXISTS `loja_roupas`;