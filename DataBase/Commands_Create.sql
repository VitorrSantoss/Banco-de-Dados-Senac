-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema loja_roupas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema loja_roupas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loja_roupas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `loja_roupas` ;

-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_categoria_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_categoria_produto` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `qtd_disponivel` INT NOT NULL,
  `data_entrada` DATETIME NOT NULL,
  `data_saida` DATETIME NOT NULL,
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(18) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `cep_UNIQUE` (`cep` ASC) VISIBLE,
  UNIQUE INDEX `cidade_UNIQUE` (`cidade` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_funcionario` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_marca` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_produtos` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `tamanho` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `tb_categoria_produto_id_categoria` INT NOT NULL,
  `tb_marca_id_marca` INT NOT NULL,
  `tb_fornecedor_id_fornecedor` INT NOT NULL,
  `tb_estoque_id_estoque` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_tb_produtos_tb_categoria_produto_idx` (`tb_categoria_produto_id_categoria` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_marca1_idx` (`tb_marca_id_marca` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_fornecedor1_idx` (`tb_fornecedor_id_fornecedor` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_estoque1_idx` (`tb_estoque_id_estoque` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_tb_categoria_produto`
    FOREIGN KEY (`tb_categoria_produto_id_categoria`)
    REFERENCES `loja_roupas`.`tb_categoria_produto` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_marca1`
    FOREIGN KEY (`tb_marca_id_marca`)
    REFERENCES `loja_roupas`.`tb_marca` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_fornecedor1`
    FOREIGN KEY (`tb_fornecedor_id_fornecedor`)
    REFERENCES `loja_roupas`.`tb_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_estoque1`
    FOREIGN KEY (`tb_estoque_id_estoque`)
    REFERENCES `loja_roupas`.`tb_estoque` (`id_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_vendas` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATE NOT NULL,
  `tb_produtos_id` INT NOT NULL,
  `tb_funcionario_id_funcionario` INT NOT NULL,
  `tb_clientes_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `fk_tb_vendas_tb_funcionario1_idx` (`tb_funcionario_id_funcionario` ASC) VISIBLE,
  INDEX `fk_tb_vendas_tb_clientes1_idx` (`tb_clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tb_vendas_tb_funcionario1`
    FOREIGN KEY (`tb_funcionario_id_funcionario`)
    REFERENCES `loja_roupas`.`tb_funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_vendas_tb_clientes1`
    FOREIGN KEY (`tb_clientes_id_cliente`)
    REFERENCES `loja_roupas`.`tb_clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_tamanho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_tamanho` (
  `id_tamanho` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tamanho`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_produto_tamanho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_produto_tamanho` (
  `tb_produtos_id_produto` INT NOT NULL,
  `tb_tamanho_id_tamanho` INT NOT NULL,
  PRIMARY KEY (`tb_produtos_id_produto`, `tb_tamanho_id_tamanho`),
  INDEX `fk_tb_produtos_has_tb_tamanho_tb_tamanho1_idx` (`tb_tamanho_id_tamanho` ASC) VISIBLE,
  INDEX `fk_tb_produtos_has_tb_tamanho_tb_produtos1_idx` (`tb_produtos_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_has_tb_tamanho_tb_produtos1`
    FOREIGN KEY (`tb_produtos_id_produto`)
    REFERENCES `loja_roupas`.`tb_produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_has_tb_tamanho_tb_tamanho1`
    FOREIGN KEY (`tb_tamanho_id_tamanho`)
    REFERENCES `loja_roupas`.`tb_tamanho` (`id_tamanho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_cores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_cores` (
  `id_cor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_produto_cor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_produto_cor` (
  `tb_produtos_id_produto` INT NOT NULL,
  `tb_cores_id_cor` INT NOT NULL,
  PRIMARY KEY (`tb_produtos_id_produto`, `tb_cores_id_cor`),
  INDEX `fk_tb_produtos_has_tb_cores_tb_cores1_idx` (`tb_cores_id_cor` ASC) VISIBLE,
  INDEX `fk_tb_produtos_has_tb_cores_tb_produtos1_idx` (`tb_produtos_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_has_tb_cores_tb_produtos1`
    FOREIGN KEY (`tb_produtos_id_produto`)
    REFERENCES `loja_roupas`.`tb_produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_has_tb_cores_tb_cores1`
    FOREIGN KEY (`tb_cores_id_cor`)
    REFERENCES `loja_roupas`.`tb_cores` (`id_cor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_promocao` (
  `id_promocao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `descricao` TEXT NULL,
  `tipo_desconto` VARCHAR(45) NULL,
  `valo_desconto` VARCHAR(45) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `status` VARCHAR(20) NULL,
  PRIMARY KEY (`id_promocao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_roupas`.`tb_produto_promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_roupas`.`tb_produto_promocao` (
  `tb_produtos_id_produto` INT NOT NULL,
  `tb_promocao_id_promocao` INT NOT NULL,
  PRIMARY KEY (`tb_produtos_id_produto`, `tb_promocao_id_promocao`),
  INDEX `fk_tb_produtos_has_tb_promocao_tb_promocao1_idx` (`tb_promocao_id_promocao` ASC) VISIBLE,
  INDEX `fk_tb_produtos_has_tb_promocao_tb_produtos1_idx` (`tb_produtos_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_has_tb_promocao_tb_produtos1`
    FOREIGN KEY (`tb_produtos_id_produto`)
    REFERENCES `loja_roupas`.`tb_produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_has_tb_promocao_tb_promocao1`
    FOREIGN KEY (`tb_promocao_id_promocao`)
    REFERENCES `loja_roupas`.`tb_promocao` (`id_promocao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
