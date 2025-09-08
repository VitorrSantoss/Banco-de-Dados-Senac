

CREATE DATABASE loja_de_roupas;
USE loja_de_roupas;



CREATE TABLE Produto(
  cod_unico INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  preco DOUBLE NOT NULL,
  tamanho VARCHAR(45) NOT NULL,
  cor VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL
)

-- Criação de tabelas
-- -----------------------------------------------------
-- Table `lojaroupas`.`estoque`
-- -----------------------------------------------------
CREATE TABLE `lojaroupas`.`estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `cor` VARCHAR(50) NOT NULL,
  `tamanho` VARCHAR(10) NOT NULL,
  `quantidade` INT NOT NULL DEFAULT 0,
  `ultima_atualizacao` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojaroupas`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE  `lojaroupas`.`Fornecedores` (
  `idFornecedores` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(255) NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `Fornecedorescol` VARCHAR(45) NULL,
  `nome_contato` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `logradouro` VARCHAR(255) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  
  
  PRIMARY KEY (`idFornecedores`),
  UNIQUE INDEX `razao_social_UNIQUE` (`razao_social` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
  ENGINE = InnoDB;


