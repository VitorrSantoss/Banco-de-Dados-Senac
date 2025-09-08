# 🗄️ Banco de Dados para Loja de Roupas

## 📋 Descrição do Projeto

Este projeto consiste na modelagem e implementação de um banco de dados relacional completo para gerenciar eficientemente todas as operações de uma loja de roupas. O sistema foi projetado para suportar o controle de estoque, gestão de clientes, registro de vendas e relacionamento com fornecedores.

## 🎯 Objetivo

Desenvolver uma estrutura de banco de dados robusta e normalizada que permita o armazenamento, consulta e manipulação eficiente de dados relacionados ao negócio de varejo de roupas, garantindo integridade referencial e otimização de consultas.

## 🏗️ Arquitetura do Banco de Dados

### 📊 **Entidades Principais**

#### 🛍️ **PRODUTOS**
```sql
- cod_produto (PK) - Código único identificador
- nome_produto - Nome do produto
- descricao - Descrição detalhada
- preco - Valor de venda
- tamanho - Tamanho (P, M, G, etc.)
- cor - Cor do produto
- marca - Marca do fabricante
- cod_categoria (FK) - Referência à categoria
```

#### 🏷️ **CATEGORIAS**
```sql
- cod_categoria (PK) - Código da categoria
- nome_categoria - Nome da categoria
- descricao_categoria - Descrição da categoria
```

#### 📦 **ESTOQUE**
```sql
- cod_estoque (PK) - Código do registro
- cod_produto (FK) - Referência ao produto
- quantidade_disponivel - Quantidade em estoque
- data_entrada - Data de entrada no estoque
- data_saida - Data de saída do estoque
- movimentacao - Tipo de movimentação (entrada/saída)
```

#### 🏪 **FORNECEDORES**
```sql
- cod_fornecedor (PK) - Código do fornecedor
- nome_fornecedor - Razão social
- endereco - Endereço completo
- telefone - Número de contato
- email - Email para contato
- cnpj - CNPJ da empresa
```

#### 👥 **CLIENTES**
```sql
- cod_cliente (PK) - Código do cliente
- nome_cliente - Nome completo
- cpf - CPF do cliente
- endereco - Endereço residencial
- telefone - Telefone de contato
- email - Email do cliente
- data_nascimento - Data de nascimento
```

#### 💰 **VENDAS**
```sql
- cod_venda (PK) - Número da venda
- cod_cliente (FK) - Cliente da transação
- cod_funcionario (FK) - Funcionário responsável
- data_venda - Data da transação
- valor_total - Valor total da venda
- desconto_aplicado - Valor do desconto
- forma_pagamento - Método de pagamento
- status_entrega - Status da entrega
```

#### 🛒 **ITENS_VENDA**
```sql
- cod_item (PK) - Código do item
- cod_venda (FK) - Referência à venda
- cod_produto (FK) - Produto vendido
- quantidade - Quantidade vendida
- preco_unitario - Preço unitário na venda
- subtotal - Valor total do item
```

#### 👔 **FUNCIONARIOS**
```sql
- cod_funcionario (PK) - Código do funcionário
- nome_funcionario - Nome completo
- cpf - CPF do funcionário
- cargo - Cargo/função
- telefone - Telefone de contato
- email - Email corporativo
- data_admissao - Data de admissão
```

#### 🎉 **PROMOCOES**
```sql
- cod_promocao (PK) - Código da promoção
- nome_promocao - Nome da campanha
- descricao - Descrição da promoção
- percentual_desconto - Percentual de desconto
- data_inicio - Data de início
- data_fim - Data de término
- ativa - Status da promoção
```

## 🔗 Relacionamentos

- **Produtos** ↔ **Categorias**: N:1 (Muitos produtos pertencem a uma categoria)
- **Produtos** ↔ **Estoque**: 1:N (Um produto pode ter vários registros de estoque)
- **Produtos** ↔ **Fornecedores**: N:M (Produtos podem ter vários fornecedores)
- **Clientes** ↔ **Vendas**: 1:N (Um cliente pode ter várias vendas)
- **Vendas** ↔ **Itens_Venda**: 1:N (Uma venda possui vários itens)
- **Produtos** ↔ **Itens_Venda**: 1:N (Um produto pode estar em vários itens)
- **Funcionários** ↔ **Vendas**: 1:N (Um funcionário pode fazer várias vendas)
- **Promoções** ↔ **Produtos**: N:M (Promoções podem abranger vários produtos)

## 📋 Scripts de Banco de Dados

### 🛠️ **DDL (Data Definition Language)**
- Criação das tabelas principais
- Definição de chaves primárias e estrangeiras
- Implementação de constraints e índices
- Criação de views para consultas frequentes

### 📊 **DML (Data Manipulation Language)**
- Scripts de inserção de dados de teste
- Procedures para operações complexas
- Triggers para controle de estoque automático
- Functions para cálculos de vendas

### 🔍 **DQL (Data Query Language)**
- Consultas de relatórios de vendas
- Queries de controle de estoque
- Relatórios de desempenho por período
- Análises de clientes e produtos mais vendidos

## 💾 Recursos Implementados

- **Integridade Referencial**: Chaves estrangeiras garantem consistência
- **Triggers**: Automação de atualizações de estoque
- **Views**: Simplificação de consultas complexas
- **Índices**: Otimização de performance em consultas
- **Procedures**: Operações de negócio encapsuladas
- **Functions**: Cálculos reutilizáveis

## 📈 Consultas e Relatórios

- Produtos mais vendidos por período
- Clientes com maior volume de compras
- Controle de estoque baixo
- Análise de vendas por funcionário
- Relatório de promoções e descontos aplicados
- Movimentação de estoque por produto
- Análise de fornecedores

## 🎯 Normalização

O banco de dados foi projetado seguindo as regras de normalização até a 3ª Forma Normal (3FN), garantindo:
- Eliminação de redundância de dados
- Integridade dos dados
- Facilidade de manutenção
- Otimização do espaço de armazenamento

## 🛠️ Tecnologias Utilizadas

- **SGBD**: MySQL / PostgreSQL / SQL Server
- **Linguagem**: SQL (DDL, DML, DQL, DCL)
- **Ferramentas**: MySQL Workbench, pgAdmin, SQL Server Management Studio
- **Modelagem**: Modelo Entidade-Relacionamento (MER)

## 📁 Estrutura de Arquivos

```
projeto-loja-roupas/
├── scripts/
│   ├── ddl/
│   │   ├── create_tables.sql
│   │   ├── create_indexes.sql
│   │   └── create_constraints.sql
│   ├── dml/
│   │   ├── insert_data.sql
│   │   ├── procedures.sql
│   │   └── triggers.sql
│   ├── dql/
│   │   ├── consultas_vendas.sql
│   │   ├── consultas_estoque.sql
│   │   └── relatorios.sql
│   └── views/
│       ├── view_vendas_detalhadas.sql
│       └── view_estoque_produtos.sql
├── documentacao/
│   ├── modelo_er.png
│   ├── dicionario_dados.pdf
│   └── casos_uso.md
└── README.md
```

## 🚀 Como Executar

1. **Criação do Banco**:
   ```sql
   CREATE DATABASE loja_roupas;
   USE loja_roupas;
   ```

2. **Execução dos Scripts DDL**:
   - Execute os scripts de criação de tabelas
   - Aplique as constraints e índices

3. **Inserção de Dados**:
   - Execute os scripts de população das tabelas
   - Rode os dados de teste

4. **Validação**:
   - Execute as consultas de teste
   - Verifique a integridade dos dados

## 📊 Casos de Uso do Banco

- Cadastro e consulta de produtos por categoria
- Controle de entrada e saída de mercadorias
- Processamento de vendas e emissão de cupons
- Gestão de relacionamento com fornecedores
- Análise de performance de vendas
- Controle de promoções e campanhas
- Relatórios gerenciais para tomada de decisão

## 🔧 Manutenção e Otimização

- Backup automático diário
- Monitoramento de performance das queries
- Limpeza periódica de dados históricos
- Atualização de estatísticas das tabelas
- Reorganização de índices fragmentados