```sql
CREATE DATABASE mercado;  
  
USE mercado;  
  
CREATE TABLE produtos  
(  
    idprodutos INT UNSIGNED NOT NULL AUTO_INCREMENT,  
    nome       VARCHAR(50)  NOT NULL,  
    descricao  TEXT,  
    validade   DATE         NOT NULL,  
    preco      FLOAT        NOT NULL,  
    PRIMARY KEY (idprodutos)  
);  
  
CREATE TABLE funcionarios (  
    idfuncionarios INT UNSIGNED NOT NULL AUTO_INCREMENT ,  
    nome VARCHAR(40) NOT NULL,  
    cargo VARCHAR(50) NOT NULL,  
    salario FLOAT DEFAULT 1000,  
    sexo ENUM('F','M') NOT NULL,  
    datanascimento DATE,  
    datacontracao DATE,  
    PRIMARY KEY (idfuncionarios)  
);  
  
CREATE TABLE estoque (  
    idestoque INT UNSIGNED NOT NULL AUTO_INCREMENT ,  
    idprodutos INT UNSIGNED,  
    quantidade INT DEFAULT 0,  
    PRIMARY KEY (idestoque),  
    FOREIGN KEY (idprodutos) REFERENCES produtos (idprodutos)  
);  
  
  
CREATE TABLE fornecedores (  
    idforncedores INT UNSIGNED NOT NULL AUTO_INCREMENT ,  
    nome VARCHAR(50) NOT NULL,  
    endereco VARCHAR(100) NOT NULL,  
    telefone VARCHAR(15) NOT NULL,  
    email VARCHAR(50) NOT NULL,  
    PRIMARY KEY (idforncedores)  
);  
  
CREATE TABLE clientes (  
    idclientes INT UNSIGNED NOT NULL AUTO_INCREMENT ,  
    nome VARCHAR(40) NOT NULL,  
    telefone VARCHAR(15),  
    email VARCHAR(50),  
    PRIMARY KEY (idclientes)  
);  
  
CREATE TABLE vendas  
(  
    idvendas   INT UNSIGNED NOT NULL AUTO_INCREMENT,  
    datavenda  DATE NOT NULL ,  
    quantidade INT NOT NULL,  
    idclientes INT UNSIGNED NOT NULL,  
    idprodutos INT UNSIGNED NOT NULL,  
    PRIMARY KEY (idvendas),  
    FOREIGN KEY (idprodutos) REFERENCES produtos (idprodutos),  
    FOREIGN KEY (idclientes) REFERENCES clientes (idclientes)  
);  
  
CREATE TABLE compras_fornecedores (  
    idcompra INT UNSIGNED NOT NULL AUTO_INCREMENT ,  
    idforncedores INT UNSIGNED,  
    idprodutos INT UNSIGNED,  
    quantidade INT NOT NULL,  
    preco FLOAT NOT NULL,  
    datacompra DATE,  
    PRIMARY KEY (idcompra),  
    FOREIGN KEY (idprodutos) REFERENCES produtos (idprodutos),  
    FOREIGN KEY (idforncedores) REFERENCES fornecedores (idforncedores)  
);  
  
# Inserção de dados na tabela produtos  
  
INSERT INTO produtos (nome, descricao, validade, preco) VALUES  
('Arroz', 'Arroz organico 5KG', '2027-02-02', 27.50),  
('Feijão', 'Feijão preto 1KG', '2027-03-15', 10.00),  
('Macarrão', 'Macarrão integral 500g', '2027-04-20', 8.50),  
('Azeite', 'Azeite extra virgem 500ml', '2029-05-30', 25.00),  
('Sal', 'Sal marinho 1KG', '2030-06-01', 5.00);  
  
# Inserção de dados na tabela funcionarios  
  
INSERT INTO funcionarios (nome, cargo, salario, sexo, datanascimento, datacontracao) VALUES  
('Henrique Rocha', 'Repositor', 1550.5, 'M', '2004-05-20', '2012-02-05'),  
('Julia Silva', 'Gerente', 3000.0, 'F', '1980-10-15', '2005-06-12'),  
('Carlos Souza', 'Vendedor', 2000.0, 'M', '1990-07-30', '2015-01-29'),  
('Ana Pereira', 'Caixa', 1500.0, 'F', '1995-03-25', '2018-08-01'),  
('Pedro Gomes', 'Repositor', 1550.5, 'M', '1998-12-10', '2020-05-15');  
  
# Inserção de dados na tabela estoque  
  
INSERT INTO estoque (quantidade, idprodutos) VALUES  
(600, 1),  
(550, 2),  
(350, 3),  
(250, 4),  
(270, 5);  
  
# Inserção de dados na tabela fornecedores  
  
INSERT INTO fornecedores (nome, endereco, telefone, email) VALUES  
('Camil Alimentos', 'R. Maranhão, 1293 - Santo Agostinho, Franca - SP, 14401-386', '(16) 3725-3485', 'Camilalimentos@gmail.com'),  
('Gomes da Costa', 'Av. Brigadeiro Faria Lima, 1309 - Jardim Paulistano, São Paulo - SP, 01452-002', '(11) 3038-1300', 'gomesdacosta@gmail.com'),  
('Seara Alimentos', 'R. Hungria, 1400 - Jardim Europa, São Paulo - SP, 01455-000', '(11) 3095-1300', 'searaalimentos@gmail.com'),  
('Perdigão Alimentos', 'R. Olimpíadas, 205 - Vila Olímpia, São Paulo - SP, 04551-000', '(11) 4002-2727', 'perdigaoalimentos@gmail.com'),  
('Nestlé Brasil', 'Av. das Nações Unidas, 17007 - Vila Almeida, São Paulo - SP, 04795-100', '(11) 5508-5200', 'nestlebrasil@gmail.com');  
  
# Inserção de dados na tabela clientes  
  
INSERT INTO clientes (nome, telefone, email) VALUES  
('Ithalo OLiveira','(61) 9111-3658', 'ithalo@gmail.com'),  
('João Silva','(11) 9123-4567', 'joao.silva@gmail.com'),  
('Maria Santos','(21) 9876-5432', 'maria.santos@gmail.com'),  
('Ana Pereira','(31) 1234-5678', 'ana.pereira@gmail.com');  
  
# Inserção de dados na tabela vendas  
  
INSERT INTO vendas (datavenda, quantidade, idclientes, idprodutos) VALUES  
('2023-01-01', 3, 1, 1),  
('2023-02-03', 10, 2, 2),  
('2023-03-05', 5, 3, 3),  
('2023-04-07', 8, 4, 4);  
  
# Inserção de dados na tabela compras_fornecedors  
  
INSERT INTO compras_fornecedores (idforncedores, idprodutos, quantidade, preco, datacompra) VALUES  
(1, 1, 600, 27.50, '2024-04-24'),  
(2, 2, 550, 10.00, '2024-04-24'),  
(3, 3, 350, 8.50, '2024-04-24'),  
(4, 4, 250, 25.00, '2024-04-24'),  
(5, 5, 270, 5.00, '2024-04-24');  
```