
##### Banco de Dados do Mercado

Este documento descreve a estrutura e o design do banco de dados do nosso mercado. O banco de dados foi projetado para gerenciar as operações diárias do mercado, incluindo o rastreamento de vendas, estoque, produtos, fornecedores e funcionários.

O banco de dados é composto por cinco tabelas principais:

1. **Produtos**: Armazena informações sobre todos os produtos disponíveis para venda no mercado.
2. **Estoque**: Rastreia a quantidade de cada produto disponível no estoque do mercado.
3. **Funcionários**: Mantém registros de todos os funcionários que trabalham no mercado, incluindo seus nomes, cargos e datas de nascimento e contratação.
4. **Fornecedores**: Contém informações sobre os fornecedores que fornecem produtos para o mercado.
5. **Clientes**: Contém informações sobre clientes, assim, podendo fazer uma gestão dos produtos que estão sendo comprados no mercado, refletindo no estoque em questões de quantidade.
6. **Vendas**: Registra todas as vendas realizadas, incluindo a data da venda, a quantidade de produto vendido e o produto vendido.

Cada tabela é descrita em detalhes nas seções a seguir, incluindo a descrição de cada campo e as relações entre as tabelas.

###### Códigos comentados
Esta seção diz respeito sobre os códigos fazendo uma explicativa dos campos e suas funcionalidades.

#comandos
```sql
# Cria um banco chamado 'mercado' 
create database mercado;
```

Essa primeira linha uma vez executada, criará meu banco de dados com os padrões `utf8`, isto é, esse banco terá a capacidade de suportar tipologias portuguesa-brasileira, como por exemplo, o `ç`  e acentuações.

Este é o primeiro passo. Com o banco de dados criado, devemos começar a usá-lo através do comando `use mercado;`. Com isso, podemos estruturar nossas tabelas e deixá-las prontas para receber os dados.

```sql
create table produtos(
    idprodutos int unsigned not null auto_increment,
    nome varchar(100) not null,
    descricao text,
    datavalidade date not null,
    preco float not null,
    primary key (idprodutos)
);
```

Começamos com a tabela `produtos`, que recebeu uma série de atributos com seus respectivos tipos. Vamos entender melhor essa tabela.

Antes, vamos definir um termo para auxiliar nosso entendimento. Sempre que um campo estiver definido como **NOT NULL**, entende-se que é obrigatório preencher aquele campo. Essa é a funcionalidade do parâmetro `NOT NULL`. Feita essa consideração, vamos à explicação!

-  **Idprodutos** 
	-  Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
	
- **nome** 
	- O atributo `nome` é o campo que receberá o nome do produto diretamente. Sua tipologia é `VARCHAR(100)`, isto é, tem espaço para 100 caracteres para adicionar o nome do produto.
	
- **descricao**
	- Este atributo será responsável por armazenar a descrição do produto que será armazenado. Seu tipo é `TEXT`, isto é, este parâmetro suporta grandes quantidades de caracteres, será útil para receber a descrição do produto.
	
- **dataValidade** 
	- Temos também a data de validade do produto que será armazenado, usando a tipologia `DATE`, de forma direta, aceitando apenas data para esse campo.]
	
- **preco**
	- Campo destinado armazenar o preço do produto. 


Feito a primeira tabela, iniciaremos a segunda tabela, que podemos fazer a tratativa do **estoque**.

```sql
create table estoque(
    idestoque int unsigned not null auto_increment,
    quantidade int default 0, 
    idprodutos int unsigned not null, 
    foreign key(idprodutos) references produtos (idprodutos)
);
```

- **Idestoque**: 
	- Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
    
- **quantidade**: 
	- Este campo armazena a quantidade de um determinado produto em estoque. O valor padrão é 0, o que é uma prática comum para evitar valores nulos e indicar que inicialmente não há nenhum item desse produto em estoque.
    
- **Idprodutos**:
	- Este campo é do tipo inteiro com assinatura e armazena o ID do produto associado ao item em estoque. Ele não aceita valores negativos.
    
- **foreing key(Idprodutos) references protudos (Idprodutos)**: 
	- Esta é uma chave estrangeira que faz referência ao campo `Idprodutos` na tabela `produtos`. Isso significa que cada item no estoque deve estar associado a um produto existente na tabela `produtos`.


```sql
create table funcionarios(
    idfuncionarios int unsigned not null auto_increment, 
    nome varchar(30) not null, 
    cargo varchar(30) not null, 
	salario FLOAT DEFAULT 1000,
	sexo ENUM(`F`,`M`) NOT NULL,
    datanascimento date not null, 
    datacontratacao date not null,
    primary key (idfuncionarios)
);
```


- **Idfuncionarios**: 
	- Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
    
- **nome**:
	- Este campo é responsável por armazenar o nome do funcionário. O tipo de dados `varchar(30)` foi usado, o que é adequado para acomodar a maioria dos nomes.
    
- **cargo**: 
	-  Este campo armazena o cargo do funcionário. Novamente, `varchar(30)` é uma boa escolha, pois os cargos podem ter comprimentos variados.
    
- **dataNascimento**:
	- Este campo armazena a data de nascimento do funcionário. O tipo de dados `date` é a escolha perfeita para isso.
- **salario**
	- Este campo recebe um tipo `float`, pronto para armazenar números decimais, quase não seja passado nenhum valor por padrão recebera 1000 reais.
* **sexo**
	* Este campo recebe um tipo `enum`, isto é, assumo um conjunto de valores para o campo sexo, com isso pode ser inserido apenas **M** OU **F**.  

- **dataContratacao**: 
	- Este campo armazena a data de contratação do funcionário. Assim como o campo `dataNascimento`, o tipo de dados `date` é a escolha ideal.

Vamos para tabela de fornecedores do mercado, assim podemos tratar essas informações também. 

```sql
create table fornecedores(
    idfornecedores int unsigned auto_increment not null,
    nome varchar(50) not null,
    endereco varchar(100) not null,
    telefone varchar(15) not null,
    email varchar(50) not null,
    primary key (idfornecedores)
);
```

- **Idfornecedores**
	- Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
	
- nome
	- Este campo tem sua tipologia `varchar(50)`, armazenará uma *string* de até 50 caracteres.
	
- telefone
	- Campo com o tipo `varchar(15)`, assim podendo armazenar até 15 caracteres, incluindo os caracteres diferenciais, como, parênteses e hífen.
	
- email
	- Este campo é do tipo `varchar(50) not null`, o que significa que ele pode armazenar uma string de até 50 caracteres. 

```sql
create table vendas(
    idvendas int unsigned not null auto_increment, 
    datavenda date not null, 
    quantidade int not null,
    idclientes int not null unsigned,
    idprodutos int not null unsigned, 
    primary key (idvendas), 
    foreign key (idprodutos) references produtos (idprodutos),
    foreign key (idclientes) references clientes (idclintes)
);

```

- **Idvendas**
	- Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
	
- **dataVenda**
	- Este campo é responsável por registrar a data de venda sobre um produto que irá sair do mercado. seu tipo é `date`, pronto para armazenar data. 
	
- **quantidade**
	- Este campo irá reter a quantidade de produtos de um tipo que foi retirado do mercado, assim, saberemos quais produtos estão sendo comprados com maior frequência.
	
- **Idprodutos**
	- Esta é uma chave estrangeira que faz referência ao campo `Idprodutos` na tabela `produtos`. Isso significa que cada venda deve estar associado a um produto existente na tabela `produtos`.


```sql
create table compras_fornecedores(
    idcompras int unsigned auto_increment not null,
    nomeproduto varchar(40) not null,
    quantidade int not null,
    preco float not null, 
    datacompra date not null, 
    idfornecedores int unsigned not null,
    foreign key (idfornecedores) references fornecedores (idfornecedores)
);
```

- **Idcompras**
	-  Este campo é do tipo `int unsigned auto_increment not null`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.
	
- **nomeProduto**
	- Este campo é do tipo `varchar(40) not null`, isto é, poderá armazenar até 40 caracteres e será obrigatório o preenchimento deste campo, por ter o parâmetro **not null**.
	
- **quantidade**
	- Este campo será responsável por armazenar a quantidade de produtos comprados. Por isso seu tipo é inteiro. 
	
-  **preco**
	- Este campo é do tipo `float not null`, o preço pode ser decimal ou inteiro, nosso tipo poderá armazenar sem problemas.
	
- **dataCompra**
	- Este campo será responsável por a reter a data da compra do  produto, assim tendo um controle definido sobre as mercadorias que são adquiridas para o mercado.
	
- **Idfornecedores**
	- Esta é uma chave estrangeira que faz referência ao campo `Idfornecedores` na tabela `fornecedores`. Isso significa que cada compra deve estar associado a um fornecedor existente na tabela `fornecedores`.


#### Relações entre tabelas

1. **Tabela Produtos e Tabela Estoque**: 
	  - A tabela `estoque` tem uma chave estrangeira `idprodutos` que faz referência à chave primária `idprodutos` na tabela `produtos`. Isso significa que cada item no estoque está associado a um produto existente na tabela `produtos`. Portanto, se você quiser saber mais detalhes sobre um item específico no estoque, você pode usar o `idprodutos` para buscar informações na tabela `produtos`.

2. **Tabela Produtos e Tabela Vendas**: 
	  - A tabela `vendas` também tem uma chave  estrangeira `idprodutos` que faz referência à chave primária `idprodutos` na tabela `produtos`. Isso significa que cada venda registrada está associada a um produto existente na tabela `produtos`. Portanto, se você quiser saber mais detalhes sobre um produto vendido, você pode usar o `idprodutos` para buscar informações na tabela `produtos`.
    
3. **Tabela Fornecedores e Tabela Compras_Fornecedores**: 
	  - A tabela `compras_fornecedores` tem uma chave estrangeira `idfornecedores` que faz referência à chave primária `idfornecedores` na tabela `fornecedores`. Isso significa que cada compra registrada está associada a um fornecedor existente na tabela `fornecedores`. Portanto, se você quiser saber mais detalhes sobre um fornecedor de um produto comprado, você pode usar o `idfornecedores` para buscar informações na tabela `fornecedores`.

```sql
create table clientes(
    idclientes int unsigned not null auto_increment,
    nome varchar(45) not null,
    telefone varchar(15),
    email varchar(50),
    primary key (idclientes)
);
```

- **idclientes**
	* Este campo é do tipo `int unsigned not null auto_increment`. Isso significa que ele é um número inteiro sem sinal (ou seja, não aceita valores negativos), que incrementa automaticamente cada vez que um novo registro é inserido na tabela. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco. Este campo é a chave primária da tabela, o que significa que cada valor deve ser único e serve como o identificador principal para cada registro.

- **nome**
	- Este campo é do tipo `varchar(50) not null`, o que significa que ele espera receber uma string de até 50 caracteres. O atributo `not null` indica que este campo deve sempre ter um valor; ele não pode ser deixado em branco.

- **endereco**
    - Este campo é do tipo `varchar(100)`, o que significa que ele pode receber uma string de até 100 caracteres. Este campo pode ser deixado em branco.

- **telefone**
	-  Este campo é do tipo `varchar(15)`, o que significa que ele pode receber uma string de até 15 caracteres. Este campo pode ser deixado em branco.

- **email**
    - Este campo é do tipo `varchar(50)`, o que significa que ele pode receber uma string de até 50 caracteres. Este campo pode ser deixado em branco.

##### Inserção de dados 

Nesta seção será explicado o comando utilizado para inserir informações ao banco, com isso fazer a utilização do comando `insert` e seus parâmetros.  

O comando `insert` é utilizado para inserir informações em uma tabela existente, com isso, podemos fazer uma indicação mais precisa usamos o parâmetro `into` para indicar 'essa tabela', passamos o argumentos no primeiro conjunto de parênteses após isso, indicamos os valores com o `values` e jogamos os valores no segundo conjunto de parênteses, assim encerramos o bloco de inserção.

```sql  
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

