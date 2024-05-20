
###### Banco de Dados do Mercado

Este documento descreve a estrutura e o design do banco de dados Modelocomercial. O banco de dados foi projetado para gerenciar as operações diárias, incluindo o rastreamento de vendas, estoque, produtos, fornecedores e compras dos forncedores.

O banco de dados é composto por cinco tabelas principais:

1. **Produtos**: Armazena informações sobre todos os produtos disponíveis para venda no mercado.
2. **Estoque**: Rastreia a quantidade de cada produto disponível no estoque do mercado.
3. **Fornecedores**: Contém informações sobre os fornecedores que fornecem produtos para o mercado.
5. **Clientes**: Contém informações sobre clientes, assim, podendo fazer uma gestão dos produtos que estão sendo comprados no mercado, refletindo no estoque em questões de quantidade.
6. **Vendas**: Registra todas as vendas realizadas, incluindo a data da venda, a quantidade de produto vendido e o produto vendido.
7. **Compras dos Fornecedores**: finalidade é resgistrar às compras para o mercado de produtos. 

Cada tabela é descrita em detalhes nas seções a seguir, incluindo a descrição de cada campo e as relações entre as tabelas.

###### Códigos comentados
Esta seção diz respeito sobre os códigos fazendo uma explicativa dos campos e suas funcionalidades.

#comandos
```sql
# Cria um banco chamado 'Modelocomercial' 
create database Modelocomercial;
```

Este é o primeiro passo. Com o banco de dados criado, devemos começar a usá-lo através do comando `use Modelocomercial;`. Com isso, podemos estruturar nossas tabelas e deixá-las prontas para receber os dados.

```sql
	create table Cliente(
    ID_Cliente int not null auto_increment,
    Nome_Cliente varchar(45),
    Telefone varchar(15),
    Email varchar(100),
    Data_Nascimento date,
    primary key (ID_Cliente));
```

* ID_Cliente
	* Chave primária, responsável por gerenciar os registrios únicos na tabela.

* Nome_Cliente
	* Irá reter o nome do cliente.

* Telefone
	* Telefone do cliente.

* Email
	* Email do cliente. 

* Data_Nascimento 
	* Irá reter a data de nascimento do cliente.

Os campos que são do tipo **varchar(45)** , armazenará caracteres, textos com a quantidade de caracteres estabelecidos no parênteses. 
Tipo **date e int**, date armazena datas no padrão americano e int valores inteiros. 

```sql
create table Fornecedor(
    ID_Fornecedor int not null auto_increment,
    Nome_Fornecedor varchar(50),
    Email varchar(100),
    Telefone varchar(15),
    Endereco varchar(100),
    Tipo varchar(45),
    primary key(ID_Fornecedor));
```

Tabela Fornecedor, essa entidade guardará infromações sobre os fornecedores, assim podendo ter um controle de empresas auxiliares ao comécio. 

 * ID_Fornecedor: 
	 * Chave primária, identificador único para cada fornecedor.
 
* Nome_Fornecedor:

	* Nome do fornecedor.
*  Email:

	* Endereço de e-mail do fornecedor. 
* Telefone:

	* Contato telefônico do fornecedor.
*  Endereco: 

	* Endereço do fornecedor.

*  Tipo: 
	* Categoria ou tipo de produtos que o fornecedor oferece.

Tabela de produtos, onde todas as mercadorias do comércio ficará retida.

```sql
create table Produto(
    ID_Produto int not null auto_increment,
    Nome_Produto varchar(50),
    Descricao_Produto varchar(100),
    Valor_Produto float,
    Tipo_Produto varchar(45),
    ID_Fornecedor int,
    primary key(ID_Produto),
    foreign key(ID_Fornecedor) references Fornecedor(ID_Fornecedor)
);
```

- ID_Produto: 
	- Chave primária, identificador único para cada produto.

- Nome_Produto:
	- Nome do produto.

- Descricao_Produto:
	- Descrição detalhada do produto.

- Valor_Produto:
	- Preço do produto.

- Tipo_Produto: 
	- Categoria ou tipo do produto.

- ID_Fornecedor:
	- Chave estrangeira que referencia o fornecedor do produto.

Gestão de controle sobre às vendas no comércio, a finalidade dessa tabela.

```sql
create table Venda(
    ID_Venda int not null auto_increment,
    ID_Produto int not null,
    ID_Cliente int not null,
    Data_Venda date not null,
    Quantidade int not null,
    Valor_Final float,
    primary key(ID_Venda),
    foreign key(ID_Produto) references Produto(ID_Produto),
    foreign key(ID_Cliente) references Cliente(ID_Cliente)
);
```

- ID_Venda: 
	- Chave primária, identificador único para cada venda.

- ID_Produto:
	- Chave estrangeira que referencia o produto vendido.

- ID_Cliente: 
	- Chave estrangeira que referencia o cliente que realizou a compra.

- Data_Venda: 
	-  Data em que a venda foi realizada.

- Quantidade: 
	-  Quantidade do produto vendido.

- Valor_Final: 
	- Valor total da venda.

Controle de Estoque, gestão geral sobre as mercadorias do comércio.

```sql
create table Estoque(
    ID_Estoque int not null auto_increment,
    ID_Produto int not null,
    Quantidade int not null,
    Data_Entrega date not null,
    primary key(ID_Estoque),
    foreign key(ID_Produto) references Produto(ID_Produto)
);
```

- ID_Estoque: 
	- Chave primária, identificador único para cada registro de estoque.

- ID_Produto: 
	- Chave estrangeira que referencia o produto em estoque.

- Quantidade:
	- Quantidade do produto disponível no estoque.

- Data_Entrega: 
	- Data em que o produto foi entregue ao estoque.

```sql
create table Compra_Fornecedor(
    ID_Compra int not null auto_increment,
    ID_Fornecedor int not null,
    Categoria varchar(45) not null,
    Quantidade int not null,
    Data_Compra date not null,
    Valor_Total float,
    primary key(ID_Compra),
    foreign key(ID_Fornecedor) references Fornecedor(ID_Fornecedor)
);
```

- ID_Compra:
	- Chave primária, identificador único para cada compra realizada pelo mercado.

- ID_Fornecedor:
	- Chave estrangeira que referencia o fornecedor da compra.

- Categoria:
	- Categoria dos produtos comprados.

- Quantidade:
	- Quantidade de produtos comprados.

- Data_Compra:
	- Data em que a compra foi realizada.

- Valor_Total:
	- Valor total da compra.


##### Relações entre tabelas

Relações entre tabelas
- Produto e Fornecedor: 
	- A tabela Produto tem uma chave estrangeira ID_Fornecedor que faz referência à chave primária ID_Fornecedor na tabela Fornecedor, associando cada produto ao seu respectivo fornecedor.

- Venda, Produto e Cliente: 
	- A tabela Venda associa cada venda a um produto e um cliente, usando as chaves estrangeiras ID_Produto e ID_Cliente.

- Estoque e Produto: 
	- A tabela Estoque utiliza a chave estrangeira ID_Produto para associar cada registro de estoque a um produto específico.

- Compra_Fornecedor e Fornecedor: 
	- A tabela Compra_Fornecedor associa cada compra a um fornecedor específico através da chave estrangeira ID_Fornecedor.
