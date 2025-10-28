# 🍽️ Projeto SQL – Banco de Dados para Restaurante

### 📋 Descrição do Projeto
Este projeto tem como objetivo **modelar e implementar um banco de dados relacional** para o gerenciamento completo de um restaurante, incluindo controle de pedidos, clientes, produtos, estoque e vendas.

A proposta visa aplicar conceitos de **modelagem de dados, normalização e consultas SQL**, criando uma base sólida para relatórios gerenciais e tomada de decisão baseada em dados.

---

### 🎯 Objetivos
- Criar uma estrutura de banco de dados relacional eficiente e normalizada;  
- Permitir consultas sobre pedidos, clientes, produtos e faturamento;  
- Demonstrar domínio das principais operações SQL (CRUD, JOINs, agregações, funções de janela);  
- Oferecer insights operacionais para otimização do negócio.  

---

### 🧠 Metodologia e Abordagem
1. **Modelagem conceitual e lógica** — elaboração do diagrama entidade-relacionamento (DER) e definição das chaves primárias e estrangeiras;  
2. **Criação do banco e tabelas** — uso de comandos `CREATE TABLE`, `ALTER TABLE` e restrições (`FOREIGN KEY`, `PRIMARY KEY`);  
3. **Inserção de dados simulados** — popular as tabelas com informações representativas do dia a dia do restaurante;  
4. **Consultas SQL** — desenvolvimento de queries para gerar relatórios e análises de desempenho;  
5. **Otimização e validação** — análise da consistência e desempenho das consultas.  

---

### 🛠️ Tecnologias Utilizadas
- **SQL** (MySQL)  
- **Workbench**  
---

### 📊 Principais Consultas e Resultados
- Listagem de **pedidos com valores totais** e clientes correspondentes;  
- Relatórios de **produtos mais vendidos e mais rentáveis**;  
- Consultas de **estoque mínimo e necessidade de reposição**;  
- Cálculo de **receita total e média diária/mensal**;  
- Identificação de **clientes recorrentes e ticket médio**.

---

### 💡 Impacto de Negócio
O projeto demonstra como **bancos de dados relacionais bem estruturados** ajudam empresas do setor alimentício a:
- Controlar melhor suas operações;  
- Reduzir perdas de estoque;  
- Automatizar relatórios financeiros e operacionais;  
- Apoiar decisões estratégicas com base em dados confiáveis.  

---

### 📁 Estrutura do Repositório
📂 Projeto_SQL_Restaurante
┣ 📜 create_tables.sql
┣ 📜 insert_data.sql
┣ 📜 queries_relatorios.sql
┣ 📜 modelo_ER.png
┗ 📄 README.md


### 📈 Exemplos de Consultas
```sql
-- 1️⃣ Produtos mais vendidos
SELECT produto, COUNT(*) AS total_vendido
FROM pedidos
GROUP BY produto
ORDER BY total_vendido DESC;

-- 2️⃣ Receita total por mês
SELECT MONTH(data_pedido) AS mes, SUM(valor_total) AS receita
FROM pedidos
GROUP BY mes
ORDER BY mes;
