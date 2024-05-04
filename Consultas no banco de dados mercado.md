######  1- Mostrando todas as tabelas

```sql
SHOW TABLES;
```
![Pasted image 20240424230501](https://github.com/RickLinuux/projeto-mysql/assets/156127952/1a6698e9-8177-4fdf-aec4-aa50b89cce5f)


###### 2- Mostrando todos os dados da tabela produtos
```sql
SELECT * FROM produtos;
```
![[Pasted image 20240424230833.png]]

###### **3- Listar todos os produtos em estoque:**
```sql
SELECT  produtos.nome, estoque.quantidade FROM  
produtos JOIN estoque ON produtos.idprodutos = estoque.idprodutos;
```
![[Pasted image 20240424232140.png]]

###### **4- Encontrar o funcionário com o maior salário:**
```sql
SELECT nome, salario FROM funcionarios WHERE  
salario = (SELECT MAX(salario) as maiorSalario from funcionarios);
```
![[Pasted image 20240424232848.png]]

####### **5- Obter a quantidade total de um produto específico vendido:**
```sql
SELECT produtos.nome, SUM(vendas.quantidade) AS quantidadeVendas  
FROM produtos JOIN vendas ON produtos.idprodutos = vendas.idprodutos  
GROUP BY produtos.nome;
```
![[Pasted image 20240424233158.png]]

###### **6- Listar todos os clientes que fizeram compras:**
```sql
SELECT DISTINCT clientes.nome  
FROM clientes  
JOIN vendas ON clientes.idclientes = vendas.idclientes;
```
![[Pasted image 20240424233458.png]]


###### 7- Procurar um fornecedor através de um produto especifico


```sql
SELECT fornecedores.nome FROM fornecedores JOIN  
compras_fornecedores ON fornecedores.idforncedores = compras_fornecedores.idforncedores  
WHERE compras_fornecedores.idprodutos = (SELECT idprodutos FROM produtos WHERE nome = 'Arroz');
```
![[Pasted image 20240424233840.png]]

###### 8- Mostrar todos os funcionários separados por sexo
```sql
SELECT sexo, COUNT(*) AS quantidade  
FROM funcionarios GROUP BY sexo ;
```
![[Pasted image 20240424234611.png]]
