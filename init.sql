-- 1. CRIAÇÃO DO BANCO DE DADOS
-- Remove o banco se ele já existir (útil se você rodar o script mais de uma vez)
DROP DATABASE IF EXISTS livraria_db;
CREATE DATABASE livraria_db;
USE livraria_db;

-- 2. CRIAÇÃO DAS TABELAS
-- Tabela de Clientes
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela de Livros (Produtos)
CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Pedidos 
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_livro INT,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id) ON DELETE CASCADE
);

-- OBS:
-- ON DELETE CASCADE (Cascateamento de Exclusão):
-- Esta regra de integridade garante que, se um registro na tabela pai (livro ou cliente)
-- for apagado, todos os registros filhos vinculados a ele na tabela dependente (pedidos)
-- serão excluídos automaticamente pelo MySQL.
-- 
-- Sem isso, se você tentasse deletar um livro pelo aplicativo React Native, por exemplo,
-- o MySQL retornaria um erro de segurança (Foreign Key Constraint), impedindo a exclusão, 
-- porque o livro "deixaria órfão" um histórico de pedidos cadastrado.
--
-- O ON DELETE CASCADE funciona como uma linha de dominós. Se você derrubar o dominó 
-- principal (o Livro), todas as peças que dependem dele (os pedidos daquele livro) caem 
-- juntas automaticamente para manter o banco limpo e sem dados perdidos.

-- 3. INSERÇÃO DE DADOS DE TESTE (POPULAR O BANCO)
-- Inserindo Clientes
INSERT INTO cliente (nome, email, data_cadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '2026-01-15'),
('Bruno Costa', 'bruno.costa@email.com', '2026-02-10'),
('Carlos Souza', 'carlos.souza@email.com', '2026-03-01');

-- Inserindo Livros (Corrigido de 'livros' para 'livro')
INSERT INTO livro (titulo, autor, preco, estoque) VALUES
('Introdução ao SQL', 'Luke Code', 49.90, 15),
('Bancos de Dados Relacionais', 'Maria Ramalho', 89.90, 8),
('Lógica de Programação', 'Alan Turing', 35.00, 20);

-- Inserindo Pedidos
INSERT INTO pedido (id_cliente, id_livro, data_pedido, quantidade) VALUES
(1, 1, '2026-03-05', 1), -- Ana comprou Introdução ao SQL
(2, 3, '2026-03-06', 2), -- Bruno comprou 2 Lógicas de Programação
(1, 2, '2026-03-07', 1); -- Ana comprou Bancos de Dados Relacionais
