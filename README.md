# Sistema de Banco de Dados - Loja de Roupas

## 📋 Descrição do Projeto

Este projeto consiste em um sistema completo de banco de dados para uma loja de roupas, desenvolvido em MySQL. O sistema gerencia produtos, vendas, clientes, funcionários, fornecedores, estoque e promoções de forma integrada e eficiente.

## 🗂️ Estrutura do Projeto

```
DataBase/
├── Commands_Create.sql      # Criação das tabelas e estrutura do banco
├── Commands_Insert.sql      # Inserção de dados de exemplo
├── Commands_Select.sql      # Consultas e relatórios diversos
├── Commands_Update.sql      # Comandos de atualização de dados
├── Commands_Delete.sql      # Comandos de exclusão de dados
├── Commands_AlterTable.sql  # Alterações na estrutura das tabelas
├── Commands_DropTable.sql   # Remoção de tabelas
└── Commands_View.sql        # Criação de views para relatórios
```

## 🏗️ Arquitetura do Banco de Dados

### Schema Principal: `loja_roupas`

O banco de dados é composto pelas seguintes tabelas principais:

#### Tabelas de Entidades Principais
- **`tb_clientes`** - Dados dos clientes da loja
- **`tb_produtos`** - Catálogo de produtos disponíveis
- **`tb_funcionario`** - Informações dos funcionários
- **`tb_fornecedor`** - Dados dos fornecedores
- **`tb_vendas`** - Registro de todas as vendas realizadas
- **`tb_estoque`** - Controle de estoque dos produtos

#### Tabelas de Categorização
- **`tb_categoria_produto`** - Categorias dos produtos
- **`tb_marca`** - Marcas dos produtos
- **`tb_tamanho`** - Tamanhos disponíveis
- **`tb_cores`** - Cores disponíveis
- **`tb_promocao`** - Promoções ativas

#### Tabelas de Relacionamento (Many-to-Many)
- **`tb_produto_tamanho`** - Relaciona produtos com tamanhos
- **`tb_produto_cor`** - Relaciona produtos com cores
- **`tb_produto_promocao`** - Relaciona produtos com promoções

#### Tabela Adicional
- **`tb_endereco_fornecedor`** - Endereços dos fornecedores (normalização)

## 🚀 Como Executar

### Pré-requisitos
- MySQL Server 8.0 ou superior
- Cliente MySQL (MySQL Workbench, phpMyAdmin, ou linha de comando)

### Instalação

1. **Criar o banco de dados:**
   ```bash
   mysql -u root -p < Commands_Create.sql
   ```

2. **Inserir dados de exemplo:**
   ```bash
   mysql -u root -p < Commands_Insert.sql
   ```

3. **Criar views para relatórios:**
   ```bash
   mysql -u root -p < Commands_View.sql
   ```

4. **(Opcional) Aplicar modificações estruturais:**
   ```bash
   mysql -u root -p < Commands_AlterTable.sql
   ```

## 📊 Funcionalidades Principais

### Relatórios Disponíveis

#### Views Criadas
- `v_relatorio_vendas_por_funcionario` - Performance de vendas por funcionário
- `v_produtos_mais_vendidos` - Ranking dos produtos mais populares
- `v_receita_por_categoria` - Receita gerada por categoria
- `v_clientes_mais_frequentes` - Clientes mais ativos
- `v_preco_medio_por_categoria` - Análise de preços por categoria
- `v_produtos_em_estoque_baixo` - Produtos com estoque crítico
- `v_vendas_por_mes` - Vendas mensais
- `v_receita_por_cargo` - Performance por cargo de funcionário
- `v_total_produtos_por_fornecedor` - Produtos por fornecedor
- `v_receita_por_ano_e_marca` - Análise temporal por marca

#### Consultas Analíticas (Commands_Select.sql)
1. Relatório de vendas por funcionário
2. Produtos mais vendidos (Top 5)
3. Desempenho por categoria
4. Clientes mais frequentes
5. Análise de preço por categoria
6. Produtos por fornecedor específico
7. Ticket médio das vendas
8. Vendas por marca
9. Popularidade por tamanho
10. Produtos acima da média de preços
11. Receita por cargo de funcionário
12. Relatório completo de clientes
13. Produtos com desconto ativo
14. Total de produtos por fornecedor
15. Vendas por fornecedor
16. Tempo médio no estoque
17. Vendas por cor
18. Vendas por categoria e tamanho
19. Performance de vendedor por categoria
20. Receita anual por marca

### Operações CRUD Completas

- **CREATE**: Estruturas de tabelas com relacionamentos
- **READ**: Consultas complexas com JOINs e agregações
- **UPDATE**: Atualizações de preços, dados pessoais, status
- **DELETE**: Exclusões com tratamento de chaves estrangeiras

## 🔧 Modificações Estruturais

O arquivo `Commands_AlterTable.sql` inclui melhorias como:

- Adição de colunas para melhor controle (preço_custo, data_cadastro, etc.)
- Remoção de redundâncias (campos duplicados)
- Normalização de endereços
- Campos para controle de entrega e observações

## 📈 Dados de Exemplo

O sistema inclui dados de teste para:
- **20 categorias** de produtos
- **20 clientes** com informações completas
- **20 registros** de estoque
- **20 fornecedores** distribuídos pelo Brasil
- **20 funcionários** com diferentes cargos
- **20 marcas** conhecidas do mercado
- **20 produtos** diversos
- **20 vendas** realizadas
- **Relacionamentos** completos entre entidades

## 🔍 Principais Features

### Controle de Estoque
- Rastreamento de entrada e saída
- Alertas de estoque baixo
- Histórico de movimentações

### Sistema de Promoções
- Promoções por produto
- Diferentes tipos de desconto
- Controle de período e status

### Análises Comerciais
- Performance de vendedores
- Produtos mais lucrativos
- Sazonalidade de vendas
- Análise de fornecedores

### Gestão de Clientes
- Histórico completo de compras
- Clientes mais valiosos
- Data de cadastro para campanhas

## ⚠️ Considerações Importantes

1. **Chaves Estrangeiras**: O sistema utiliza CASCADE em algumas operações - cuidado ao excluir dados
2. **Backup**: Sempre faça backup antes de executar operações de DELETE ou DROP
3. **Performance**: As views podem impactar performance em grandes volumes - considere indexação adicional
4. **Normalização**: Algumas redundâncias foram mantidas para facilitar consultas frequentes

## 📝 Licença

Este projeto é de uso educacional e pode ser modificado conforme necessário para atender requisitos específicos de negócio.

## 🤝 Contribuições

Para contribuir com melhorias:
1. Analise a estrutura atual
2. Proponha otimizações
3. Teste em ambiente de desenvolvimento
4. Documente as alterações

---

**Desenvolvido para fins educacionais e comerciais** 
*Sistema completo de gerenciamento para lojas de roupas*