
/* CRIAÇÃO DO BANCO DE DADOS*/

CREATE DATABASE loja_roupas;
USE loja_roupas;

/* CRIAÇÃO DAS TABELAS*/

CREATE TABLE tb_categoria_produto ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE tb_estoque (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    qtd_disponivel VARCHAR(45) NOT NULL,
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME NOT NULL
);

CREATE TABLE tb_fornecedores (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    UNIQUE INDEX cnpj_UNIQUE (cnpj ASC),
    UNIQUE INDEX telefone_UNIQUE (telefone ASC),
    UNIQUE INDEX cep_UNIQUE (cep ASC),
    UNIQUE INDEX cidade_UNIQUE (cidade ASC)
);

CREATE TABLE tb_produtos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_produto INT UNSIGNED NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(45) NULL DEFAULT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(45) NOT NULL,
    cor VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL
);

CREATE TABLE tb_clientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(75) NOT NULL,
    telefone VARCHAR(20) NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(45) NOT NULL,
    UNIQUE INDEX cpf_UNIQUE (cpf ASC)
);

CREATE TABLE tb_vendas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    tb_produtos_id INT NOT NULL
);

CREATE TABLE tb_funcionarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    contato VARCHAR(45) NOT NULL,
    indentificacao VARCHAR(45) NOT NULL
);

CREATE TABLE tb_produtos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_produto INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(255) NULL DEFAULT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(45) NULL DEFAULT NULL,
    cor VARCHAR(45) NULL DEFAULT NULL,
    marca VARCHAR(45) NULL DEFAULT NULL,
    tb_categoria_produto_id INT NOT NULL,
    UNIQUE INDEX cod_produto (cod_produto ASC),
    INDEX tb_categoria_produto_id (tb_categoria_produto_id ASC),
    CONSTRAINT tb_produtos_ibfk_1 FOREIGN KEY (tb_categoria_produto_id) REFERENCES tb_categoria_produtos (id)
);
