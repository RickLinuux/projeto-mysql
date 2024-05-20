DROP DATABASE IF EXISTS Modelocomercial;
CREATE DATABASE Modelocomercial;
USE Modelocomercial;

-- Criação do banco e tabelas
-- Tratamento das chaves primárias e estrangeiras
-- Atualização 16/05/2024

create table Cliente(
    ID_Cliente int not null auto_increment,
    Nome_Cliente varchar(45),
    Telefone varchar(15),
    Email varchar(100),
    Data_Nascimento date,
    primary key (ID_Cliente));

create table Fornecedor(
    ID_Fornecedor int not null auto_increment,
    Nome_Fornecedor varchar(50),
    Email varchar(100),
    Telefone varchar(15),
    Endereco varchar(100),
    Tipo varchar(45),
    primary key(ID_Fornecedor));

create table Produto(
    ID_Produto int not null auto_increment,
    Nome_Produto varchar(50),
    Descricao_Produto varchar(100),
    Valor_Produto float,
    Tipo_Produto varchar(45),
    ID_Fornecedor int,
    primary key(ID_Produto),
    foreign key(ID_Fornecedor) references Fornecedor(ID_Fornecedor));

create table Venda(
    ID_Venda int not null auto_increment,
    ID_Produto int not null,
    ID_Cliente int not null,
    Data_Venda date not null,
    Quantidade int not null,
    Valor_Final float,
    primary key(ID_Venda),
    foreign key(ID_Produto) references Produto(ID_Produto) ,
    foreign key(ID_Cliente) references Cliente(ID_Cliente));

create table Estoque(
    ID_Estoque int not null auto_increment,
    ID_Produto int not null,
    Quantidade int not null,
    Data_Entrega date not null,
    primary key(ID_Estoque),
    foreign key(ID_Produto) references Produto(ID_Produto) );

create table Compra_Fornecedor(
    ID_Compra int not null auto_increment,
    ID_Fornecedor int not null,
    Categoria varchar(45) not null,
    Quantidade int not null,
    Data_Compra date not null,
    Valor_Total float,
    primary key(ID_Compra),
    foreign key(ID_Fornecedor) references Fornecedor(ID_Fornecedor) );
