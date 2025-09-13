-- =========================================================
-- COMANDOS DML - INSERT (Inserir)
-- =========================================================

INSERT INTO `tb_categoria_produto` (`nome`) VALUES
('Vestuário Feminino'),
('Vestuário Masculino'),
('Vestuário Infantil'),
('Calçados'),
('Acessórios'),
('Moda Praia Feminina'),
('Moda Praia Masculina'),
('Esporte'),
('Jeans'),
('Camisetas'),
('Saias e Vestidos'),
('Blusas e Camisas'),
('Jaquetas e Casacos'),
('Calças e Shorts'),
('Bolsas'),
('Óculos de Sol'),
('Relógios'),
('Chapéus e Bonés'),
('Cintos'),
('Bijuterias');

-- Inserts para a tabela `tb_clientes` (20 registros)
INSERT INTO `tb_clientes` (`nome`, `cpf`, `email`, `endereco`, `telefone`) VALUES
('Ana Clara Lima', '111.111.111-11', 'ana.clara@email.com', 'Rua das Flores, 123', '(11) 98765-4321'),
('Bruno da Silva', '222.222.222-22', 'bruno.silva@email.com', 'Avenida Principal, 456', '(21) 99876-5432'),
('Carla Souza', '333.333.333-33', 'carla.souza@email.com', 'Rua Secundária, 789', '(31) 98765-1234'),
('Daniel Costa', '444.444.444-44', 'daniel.costa@email.com', 'Praça da Liberdade, 10', '(41) 99876-1234'),
('Elisa Fernandes', '555.555.555-55', 'elisa.f@email.com', 'Rua da Amizade, 11', '(51) 98765-5678'),
('Felipe Mendes', '666.666.666-66', 'felipe.m@email.com', 'Avenida do Comércio, 22', '(61) 99876-5678'),
('Gabriela Nunes', '777.777.777-77', 'gabriela.n@email.com', 'Rua das Árvores, 33', '(71) 98765-9012'),
('Henrique Rocha', '888.888.888-88', 'henrique.r@email.com', 'Rua do Sol, 44', '(81) 99876-9012'),
('Isabela Santos', '999.999.999-99', 'isabela.s@email.com', 'Avenida da Praia, 55', '(91) 98765-3456'),
('João Vitor Gomes', '000.000.000-00', 'joao.vitor@email.com', 'Rua da Montanha, 66', '(13) 99876-3456'),
('Kamila Oliveira', '101.101.101-01', 'kamila.o@email.com', 'Rua dos Pássaros, 77', '(14) 98765-6789'),
('Lucas Pereira', '202.202.202-02', 'lucas.p@email.com', 'Avenida do Rio, 88', '(15) 99876-6789'),
('Maria Eduarda Ribeiro', '303.303.303-03', 'maria.eduarda@email.com', 'Rua da Floresta, 99', '(16) 98765-0123'),
('Nathalia Costa', '404.404.404-04', 'nathalia.c@email.com', 'Rua da Pedra, 100', '(17) 99876-0123'),
('Otávio Barros', '505.505.505-05', 'otavio.b@email.com', 'Avenida da Lua, 110', '(18) 98765-4567'),
('Paula Vieira', '606.606.606-06', 'paula.v@email.com', 'Rua do Vento, 120', '(19) 99876-4567'),
('Quirino Alves', '707.707.707-07', 'quirino.a@email.com', 'Rua da Estrela, 130', '(22) 98765-8901'),
('Renata Lopes', '808.808.808-08', 'renata.l@email.com', 'Avenida do Sol, 140', '(24) 99876-8901'),
('Sergio Fernandes', '909.909.909-09', 'sergio.f@email.com', 'Rua da Terra, 150', '(27) 98765-2345'),
('Tatiana Martins', '110.110.110-10', 'tatiana.m@email.com', 'Rua da Água, 160', '(28) 99876-2345');

-- Inserts para a tabela `tb_estoque` (20 registros)
-- Observação: A tabela 'tb_estoque' não está ligada a 'tb_produtos' através da chave primária,
-- mas sim em um relacionamento de muitos para um. O script de criação fornecido
-- tem uma chave estrangeira de 'tb_produtos' para 'tb_estoque', o que é incomum.
-- A seguir, os dados são inseridos com IDs sequenciais para serem referenciados posteriormente.
INSERT INTO `tb_estoque` (`qtd_disponivel`, `data_entrada`, `data_saida`) VALUES
(100, '2024-05-01 10:00:00', '2024-05-15 12:30:00'),
(50, '2024-05-02 11:00:00', '2024-05-16 13:00:00'),
(200, '2024-05-03 12:00:00', '2024-05-17 14:00:00'),
(75, '2024-05-04 13:00:00', '2024-05-18 15:00:00'),
(150, '2024-05-05 14:00:00', '2024-05-19 16:00:00'),
(120, '2024-05-06 15:00:00', '2024-05-20 17:00:00'),
(90, '2024-05-07 16:00:00', '2024-05-21 18:00:00'),
(110, '2024-05-08 17:00:00', '2024-05-22 19:00:00'),
(60, '2024-05-09 18:00:00', '2024-05-23 20:00:00'),
(80, '2024-05-10 19:00:00', '2024-05-24 21:00:00'),
(130, '2024-05-11 20:00:00', '2024-05-25 22:00:00'),
(70, '2024-05-12 21:00:00', '2024-05-26 23:00:00'),
(140, '2024-05-13 22:00:00', '2024-05-27 00:00:00'),
(180, '2024-05-14 23:00:00', '2024-05-28 01:00:00'),
(40, '2024-05-15 00:00:00', '2024-05-29 02:00:00'),
(250, '2024-05-16 01:00:00', '2024-05-30 03:00:00'),
(30, '2024-05-17 02:00:00', '2024-05-31 04:00:00'),
(220, '2024-05-18 03:00:00', '2024-06-01 05:00:00'),
(55, '2024-05-19 04:00:00', '2024-06-02 06:00:00'),
(95, '2024-05-20 05:00:00', '2024-06-03 07:00:00');

-- Inserts para a tabela `tb_fornecedor` (20 registros)
INSERT INTO `tb_fornecedor` (`cnpj`, `telefone`, `cep`, `email`, `uf`, `cidade`) VALUES
('00.000.000/0001-01', '11987654321', '01000-000', 'contato@fornecedorA.com', 'SP', 'São Paulo'),
('11.111.111/0001-11', '21998765432', '20000-000', 'vendas@fornecedorB.com', 'RJ', 'Rio de Janeiro'),
('22.222.222/0001-22', '31987651234', '30000-000', 'comercial@fornecedorC.com', 'MG', 'Belo Horizonte'),
('33.333.333/0001-33', '41998761234', '80000-000', 'faleconosco@fornecedorD.com', 'PR', 'Curitiba'),
('44.444.444/0001-44', '51987655678', '90000-000', 'atendimento@fornecedorE.com', 'RS', 'Porto Alegre'),
('55.555.555/0001-55', '61998765678', '70000-000', 'parcerias@fornecedorF.com', 'DF', 'Brasília'),
('66.666.666/0001-66', '71987659012', '40000-000', 'suporte@fornecedorG.com', 'BA', 'Salvador'),
('77.777.777/0001-77', '81998769012', '50000-000', 'info@fornecedorH.com', 'PE', 'Recife'),
('88.888.888/0001-88', '91987653456', '66000-000', 'diretoria@fornecedorI.com', 'PA', 'Belém'),
('99.999.999/0001-99', '13998763456', '11000-000', 'contato@fornecedorJ.com', 'SP', 'Santos'),
('01.010.101/0001-10', '14987656789', '17000-000', 'vendas@fornecedorK.com', 'SP', 'Bauru'),
('02.020.202/0001-20', '15998766789', '18000-000', 'comercial@fornecedorL.com', 'SP', 'Sorocaba'),
('03.030.303/0001-30', '16987650123', '14000-000', 'faleconosco@fornecedorM.com', 'SP', 'Ribeirão Preto'),
('04.040.404/0001-40', '17998760123', '15000-000', 'atendimento@fornecedorN.com', 'SP', 'São José do Rio Preto'),
('05.050.505/0001-50', '18987654567', '13000-000', 'parcerias@fornecedorO.com', 'SP', 'Campinas'),
('06.060.606/0001-60', '19998764567', '13400-000', 'suporte@fornecedorP.com', 'SP', 'Piracicaba'),
('07.070.707/0001-70', '22987658901', '25600-000', 'info@fornecedorQ.com', 'RJ', 'Petrópolis'),
('08.080.808/0001-80', '24998768901', '28900-000', 'diretoria@fornecedorR.com', 'RJ', 'Cabo Frio'),
('09.090.909/0001-90', '27987652345', '29000-000', 'contato@fornecedorS.com', 'ES', 'Vitória'),
('10.101.010/0001-01', '28998762345', '29300-000', 'vendas@fornecedorT.com', 'ES', 'Cachoeiro de Itapemirim');

-- Inserts para a tabela `tb_funcionario` (20 registros)
INSERT INTO `tb_funcionario` (`nome`, `cargo`, `contato`) VALUES
('Carlos Augusto', 'Gerente', '(11) 98765-1111'),
('Fabiana Martins', 'Vendedor', '(11) 98765-2222'),
('Gustavo Pereira', 'Atendente', '(11) 98765-3333'),
('Juliana Alves', 'Vendedor', '(11) 98765-4444'),
('Pedro Henrique', 'Atendente', '(11) 98765-5555'),
('Mariana Ferreira', 'Vendedor', '(11) 98765-6666'),
('Ricardo Santos', 'Gerente', '(11) 98765-7777'),
('Lucia Mendes', 'Atendente', '(11) 98765-8888'),
('Fernando Costa', 'Vendedor', '(11) 98765-9999'),
('Patrícia Ribeiro', 'Vendedor', '(11) 98765-0000'),
('Gabriel Oliveira', 'Vendedor', '(21) 99876-1111'),
('Cristina Nunes', 'Atendente', '(21) 99876-2222'),
('Marcos Lima', 'Vendedor', '(21) 99876-3333'),
('Simone Torres', 'Gerente', '(21) 99876-4444'),
('Diego Rocha', 'Vendedor', '(21) 99876-5555'),
('Camila Batista', 'Atendente', '(21) 99876-6666'),
('Rafaela Gomes', 'Vendedor', '(21) 99876-7777'),
('Eduardo Castro', 'Vendedor', '(21) 99876-8888'),
('Vitor Hugo', 'Atendente', '(21) 99876-9999'),
('Daniela Vaz', 'Vendedor', '(21) 99876-0000');

-- Inserts para a tabela `tb_marca` (20 registros)
INSERT INTO `tb_marca` (`nome`) VALUES
('Calvin Klein'),
('Lacoste'),
('Adidas'),
('Nike'),
('Zara'),
('Hering'),
('C&A'),
('Polo Ralph Lauren'),
('Tommy Hilfiger'),
('Levis'),
('Renner'),
('Colcci'),
('Farm'),
('Melissa'),
('Converse'),
('Ray-Ban'),
('Fossil'),
('Swatch'),
('Lupo'),
('Havaianas');

-- Inserts para a tabela `tb_tamanho` (20 registros)
INSERT INTO `tb_tamanho` (`nome`) VALUES
('PP'),
('P'),
('M'),
('G'),
('GG'),
('XG'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('Único'),
('RN');

-- Inserts para a tabela `tb_cores` (20 registros)
INSERT INTO `tb_cores` (`nome`) VALUES
('Preto'),
('Branco'),
('Azul'),
('Vermelho'),
('Verde'),
('Amarelo'),
('Rosa'),
('Roxo'),
('Laranja'),
('Cinza'),
('Marrom'),
('Bege'),
('Dourado'),
('Prateado'),
('Salmão'),
('Turquesa'),
('Bordô'),
('Verde Militar'),
('Cinza Mescla'),
('Mostarda');

-- Inserts para a tabela `tb_promocao` (20 registros)
INSERT INTO `tb_promocao` (`nome`, `descricao`, `tipo_desconto`, `valo_desconto`, `data_inicio`, `data_fim`, `status`) VALUES
('Promoção de Verão', 'Descontos de 20% em itens de moda praia.', 'Percentual', '20', '2024-12-01', '2025-01-31', 'Ativa'),
('Black Friday', 'Descontos de 50% em toda a loja.', 'Percentual', '50', '2024-11-25', '2024-11-29', 'Ativa'),
('Liquidação de Inverno', 'Até 70% de desconto em casacos e jaquetas.', 'Percentual', '70', '2024-07-01', '2024-08-31', 'Inativa'),
('Dia das Mães', '15% de desconto em roupas femininas.', 'Percentual', '15', '2025-05-01', '2025-05-15', 'Expirada'),
('Promoção de Ano Novo', 'Frete grátis para compras acima de R$200.', 'Valor Fixo', '0', '2025-01-01', '2025-01-10', 'Ativa'),
('Queima de Estoque', 'Descontos de até 80% em itens selecionados.', 'Percentual', '80', '2024-06-15', '2024-06-30', 'Inativa'),
('Promoção de Aniversário', 'Desconto de 10% no mês do seu aniversário.', 'Percentual', '10', '2024-01-01', '2024-12-31', 'Ativa'),
('Volta às Aulas', '25% de desconto em mochilas e uniformes.', 'Percentual', '25', '2025-01-15', '2025-02-15', 'Ativa'),
('Feriado da Independência', '30% de desconto em produtos verde e amarelo.', 'Percentual', '30', '2024-09-05', '2024-09-08', 'Expirada'),
('Especial Dia dos Pais', '15% de desconto em produtos masculinos.', 'Percentual', '15', '2024-08-01', '2024-08-15', 'Expirada'),
('Semana do Consumidor', '10% de desconto em toda a loja.', 'Percentual', '10', '2025-03-15', '2025-03-22', 'Ativa'),
('Promoção de Páscoa', '20% de desconto em sapatos e tênis.', 'Percentual', '20', '2025-04-01', '2025-04-10', 'Ativa'),
('Aniversário da Loja', '15% de desconto em compras acima de R$100.', 'Percentual', '15', '2024-10-01', '2024-10-10', 'Ativa'),
('Especial Fim de Ano', 'Frete grátis para todo o Brasil.', 'Valor Fixo', '0', '2024-12-20', '2024-12-31', 'Ativa'),
('Semana do Cliente', '30% de desconto em calças e shorts.', 'Percentual', '30', '2024-09-15', '2024-09-22', 'Expirada'),
('Outlet Online', 'Descontos de 40% em produtos da seção outlet.', 'Percentual', '40', '2024-06-01', '2024-09-30', 'Ativa'),
('Especial Dia dos Namorados', '15% de desconto em compras de casais.', 'Percentual', '15', '2024-06-01', '2024-06-12', 'Expirada'),
('Feira de Calçados', '10% de desconto em todos os calçados.', 'Percentual', '10', '2024-05-10', '2024-05-20', 'Expirada'),
('Semana de Moda', '20% de desconto em vestidos.', 'Percentual', '20', '2024-04-01', '2024-04-07', 'Expirada'),
('Novidades de Primavera', 'Frete grátis para compras da nova coleção.', 'Valor Fixo', '0', '2024-09-23', '2024-10-31', 'Ativa');

-- Inserts para a tabela `tb_produtos` (20 registros)
-- As chaves estrangeiras (`id_categoria`, `id_marca`, `id_fornecedor`, `id_estoque`)
-- devem corresponder aos IDs que serão gerados automaticamente.
INSERT INTO `tb_produtos` (`nome`, `descricao`, `preco`, `tamanho`, `cor`, `marca`, `tb_categoria_produto_id_categoria`, `tb_marca_id_marca`, `tb_fornecedor_id_fornecedor`, `tb_estoque_id_estoque`) VALUES
('Camiseta Estampada', 'Camiseta 100% algodão', 59.90, 'P', 'Azul', 'Hering', 10, 6, 1, 1),
('Calça Jeans Slim', 'Jeans com elastano', 129.90, '40', 'Azul', 'Levis', 9, 10, 2, 2),
('Jaqueta de Couro', 'Jaqueta sintética com zíper', 250.00, 'M', 'Preto', 'Zara', 13, 5, 3, 3),
('Vestido Floral', 'Vestido longo de verão', 180.50, 'G', 'Branco', 'Farm', 11, 13, 4, 4),
('Tênis Casual', 'Tênis de lona unissex', 150.00, '38', 'Cinza', 'Converse', 4, 15, 5, 5),
('Blusa de Tricô', 'Blusa de lã para o inverno', 99.00, 'P', 'Bege', 'Renner', 12, 11, 6, 6),
('Shorts de Moletom', 'Confortável e ideal para o dia a dia', 75.00, 'GG', 'Verde', 'Adidas', 8, 3, 7, 7),
('Bermuda de Sarja', 'Bermuda casual para homens', 89.90, '42', 'Marrom', 'Hering', 14, 6, 8, 8),
('Sandália de Salto', 'Sandália de salto alto', 165.00, '37', 'Dourado', 'Melissa', 4, 14, 9, 9),
('Cinto de Couro', 'Acessório de couro legítimo', 69.90, 'Único', 'Preto', 'Calvin Klein', 19, 1, 10, 10),
('Boné de Algodão', 'Boné ajustável com logo bordado', 45.00, 'Único', 'Azul', 'Lacoste', 18, 2, 11, 11),
('Relógio Analógico', 'Relógio com pulseira de metal', 220.00, 'Único', 'Prateado', 'Fossil', 17, 17, 12, 12),
('Bolsa de Ombro', 'Bolsa de couro sintético', 190.00, 'Único', 'Preto', 'C&A', 15, 7, 13, 13),
('Óculos de Sol', 'Óculos com proteção UV', 300.00, 'Único', 'Preto', 'Ray-Ban', 16, 16, 14, 14),
('Meia de Algodão', 'Meia cano alto com estampa', 25.00, '40', 'Cinza', 'Lupo', 19, 19, 15, 15),
('Biquíni com Bojo', 'Conjunto de biquíni para praia', 110.00, 'M', 'Rosa', 'Renner', 6, 11, 16, 16),
('Sungão de Praia', 'Bermuda de praia masculina', 85.00, 'G', 'Azul', 'Havaianas', 7, 20, 17, 17),
('Camisa Polo', 'Camisa polo com detalhes bordados', 135.00, 'P', 'Branco', 'Polo Ralph Lauren', 12, 8, 18, 18),
('Macacão Pantacourt', 'Macacão elegante para festas', 290.00, 'M', 'Vermelho', 'Tommy Hilfiger', 11, 9, 19, 19),
('Calça Legging', 'Legging para atividades físicas', 95.00, 'P', 'Preto', 'Nike', 8, 4, 20, 20);

-- Inserts para a tabela `tb_vendas` (20 registros)
INSERT INTO `tb_vendas` (`nome`, `data_venda`, `tb_produtos_id`, `tb_funcionario_id_funcionario`, `tb_clientes_id_cliente`) VALUES
('Lojas Renner', '2025-05-20', 1, 2, 1),
('C&A', '2025-05-21', 2, 2, 2),
('Riachuelo', '2025-05-22', 3, 2, 3),
('Dafiti', '2025-05-23', 4, 2, 4),
('Hering', '2024-05-24', 5, 2, 5),
('Zara', '2024-05-25', 6, 2, 6),
('H&M', '2024-05-25', 7, 2, 7),
('Shein', '2024-05-25', 8, 2, 8),
('Nike', '2025-05-10', 9, 2, 9),
('Adidas', '2025-05-05', 10, 2, 10),
('Uniqlo', '2024-05-27', 11, 2, 11),
('Amaro', '2025-05-27', 12, 2, 12),
('Centauro', '2024-05-27', 13, 2, 13),
('Zattini', '2025-05-10', 14, 2, 14),
('ASOS', '2024-05-15', 15, 2, 15),
('Lojas Renner', '2025-05-12', 16, 2, 16),
('C&A', '2024-05-12', 17, 2, 17),
('Riachuelo', '2025-05-13', 18, 2, 18),
('Dafiti', '2025-05-13', 19, 2, 19),
('Hering', '2024-05-13', 20, 2, 20);


-- Inserts para a tabela `tb_produto_tamanho` (20 registros)
INSERT INTO `tb_produto_tamanho` (`tb_produtos_id_produto`, `tb_tamanho_id_tamanho`) VALUES
(1, 2), -- Camiseta Estampada (P)
(1, 3), -- Camiseta Estampada (M)
(2, 13), -- Calça Jeans Slim (40)
(2, 14), -- Calça Jeans Slim (41)
(3, 3), -- Jaqueta de Couro (M)
(3, 4), -- Jaqueta de Couro (G)
(4, 4), -- Vestido Floral (G)
(4, 5), -- Vestido Floral (GG)
(5, 10), -- Tênis Casual (38)
(5, 11), -- Tênis Casual (39)
(6, 2), -- Blusa de Tricô (P)
(6, 3), -- Blusa de Tricô (M)
(7, 5), -- Shorts de Moletom (GG)
(7, 6), -- Shorts de Moletom (XG)
(8, 14), -- Bermuda de Sarja (42)
(8, 15), -- Bermuda de Sarja (43)
(9, 9), -- Sandália de Salto (37)
(9, 10), -- Sandália de Salto (38)
(10, 19), -- Cinto de Couro (Único)
(11, 19); -- Boné de Algodão (Único)

-- Inserts para a tabela `tb_produto_cor` (20 registros)
INSERT INTO `tb_produto_cor` (`tb_produtos_id_produto`, `tb_cores_id_cor`) VALUES
(1, 3), -- Camiseta Estampada (Azul)
(1, 1), -- Camiseta Estampada (Preto)
(2, 3), -- Calça Jeans Slim (Azul)
(2, 10), -- Calça Jeans Slim (Cinza)
(3, 1), -- Jaqueta de Couro (Preto)
(3, 11), -- Jaqueta de Couro (Marrom)
(4, 2), -- Vestido Floral (Branco)
(4, 7), -- Vestido Floral (Rosa)
(5, 10), -- Tênis Casual (Cinza)
(5, 1), -- Tênis Casual (Preto)
(6, 12), -- Blusa de Tricô (Bege)
(6, 2), -- Blusa de Tricô (Branco)
(7, 5), -- Shorts de Moletom (Verde)
(7, 10), -- Shorts de Moletom (Cinza)
(8, 11), -- Bermuda de Sarja (Marrom)
(8, 1), -- Bermuda de Sarja (Preto)
(9, 13), -- Sandália de Salto (Dourado)
(9, 1), -- Sandália de Salto (Preto)
(10, 1), -- Cinto de Couro (Preto)
(10, 11); -- Cinto de Couro (Marrom)

-- Inserts para a tabela `tb_produto_promocao` (20 registros)
INSERT INTO `tb_produto_promocao` (`tb_produtos_id_produto`, `tb_promocao_id_promocao`) VALUES
(1, 1), -- Camiseta Estampada (Promoção de Verão)
(2, 2), -- Calça Jeans Slim (Black Friday)
(3, 3), -- Jaqueta de Couro (Liquidação de Inverno)
(4, 1), -- Vestido Floral (Promoção de Verão)
(5, 2), -- Tênis Casual (Black Friday)
(6, 3), -- Blusa de Tricô (Liquidação de Inverno)
(7, 2), -- Shorts de Moletom (Black Friday)
(8, 4), -- Bermuda de Sarja (Dia das Mães)
(9, 5), -- Sandália de Salto (Promoção de Ano Novo)
(10, 6), -- Cinto de Couro (Queima de Estoque)
(11, 7), -- Boné de Algodão (Promoção de Aniversário)
(12, 8), -- Relógio Analógico (Volta às Aulas)
(13, 9), -- Bolsa de Ombro (Feriado da Independência)
(14, 10), -- Óculos de Sol (Especial Dia dos Pais)
(15, 11), -- Meia de Algodão (Semana do Consumidor)
(16, 12), -- Biquíni com Bojo (Promoção de Páscoa)
(17, 13), -- Sungão de Praia (Aniversário da Loja)
(18, 14), -- Camisa Polo (Especial Fim de Ano)
(19, 15), -- Macacão Pantacourt (Semana do Cliente)
(20, 16); -- Calça Legging (Outlet Online)
