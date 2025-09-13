-- =========================================================
-- COMANDOS DDL - ALTER TABLE (Alterar Tabela)
-- =========================================================

ALTER TABLE `loja_roupas`.`tb_fornecedor`
ADD COLUMN `nome` VARCHAR(100) NOT NULL AFTER `id_fornecedor`;

-- Script 2: Adiciona a coluna 'preço_custo' à tabela tb_produtos
-- Para controlar a margem de lucro de cada produto, adicionamos o preço de custo.
ALTER TABLE `loja_roupas`.`tb_produtos`
ADD COLUMN `preco_custo` DECIMAL(10, 2) NOT NULL AFTER `preco`;

-- Script 3: Adiciona a coluna 'data_cadastro' à tabela tb_clientes
-- Para registrar a data em que o cliente se cadastrou na loja.
ALTER TABLE `loja_roupas`.`tb_clientes`
ADD COLUMN `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `telefone`;

-- Script 4: Remove as colunas 'tamanho' e 'cor' da tabela tb_produtos
-- A informação de tamanho e cor já é tratada nas tabelas de junção, removendo a redundância.
ALTER TABLE `loja_roupas`.`tb_produtos`
DROP COLUMN `tamanho`,
DROP COLUMN `cor`,
DROP COLUMN `marca`;

-- Script 5: Adiciona a coluna 'total_venda' à tabela tb_vendas
-- Para armazenar o valor total da venda, facilitando relatórios e consultas.
ALTER TABLE `loja_roupas`.`tb_vendas`
ADD COLUMN `total_venda` DECIMAL(10, 2) NOT NULL AFTER `data_venda`;

-- Script 6: Adiciona a coluna 'desconto' à tabela tb_vendas
-- Para registrar se algum desconto foi aplicado na transação.
ALTER TABLE `loja_roupas`.`tb_vendas`
ADD COLUMN `desconto` DECIMAL(10, 2) NULL DEFAULT 0 AFTER `total_venda`;

-- Script 7: Adiciona a coluna 'qtd_vendida' à tabela tb_vendas
-- Para rastrear a quantidade de produtos vendidos por venda.
ALTER TABLE `loja_roupas`.`tb_vendas`
ADD COLUMN `qtd_vendida` INT NOT NULL AFTER `tb_produtos_id`;

-- Script 8: Adiciona a coluna 'status_entrega' à tabela tb_vendas
-- Para gerenciar o status da entrega do pedido.
ALTER TABLE `loja_roupas`.`tb_vendas`
ADD COLUMN `status_entrega` VARCHAR(45) NOT NULL DEFAULT 'Processando' AFTER `desconto`;

-- Script 9: Adiciona a coluna 'observacoes' à tabela tb_estoque
-- Para incluir notas sobre a entrada ou saída de produtos do estoque.
ALTER TABLE `loja_roupas`.`tb_estoque`
ADD COLUMN `observacoes` TEXT NULL AFTER `data_saida`;

-- Script 10: Adiciona uma nova tabela para 'Endereços do Fornecedor'
-- O campo 'cep' e 'cidade' na tabela tb_fornecedor pode ser movido para uma tabela separada para melhor organização.
-- Exemplo de adição de uma nova tabela e alteração da existente.
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_endereco_fornecedor` (
    `id_endereco` INT NOT NULL AUTO_INCREMENT,
    `cep` VARCHAR(10) NOT NULL,
    `uf` VARCHAR(2) NOT NULL,
    `cidade` VARCHAR(45) NOT NULL,
    `tb_fornecedor_id_fornecedor` INT NOT NULL,
    PRIMARY KEY (`id_endereco`),
    INDEX `fk_tb_endereco_fornecedor_tb_fornecedor1_idx` (
        `tb_fornecedor_id_fornecedor` ASC
    ) VISIBLE,
    CONSTRAINT `fk_tb_endereco_fornecedor_tb_fornecedor1` FOREIGN KEY (`tb_fornecedor_id_fornecedor`) REFERENCES `loja_roupas`.`tb_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;