/**
	Agenda de contatos
    @author Henrique Morais Teixeira
*/
-- Criar um novo banco de dados 
create database dbcarrinho;

-- selecionar o banco de dados 
use dbcarrinho;

-- verificar tabelas existentes 
show tables;

-- decimal (tipo de dados numericos não inteiro 10,2 dez digitos com 2 casas decimais)
create table carrinho (
	codigo int primary key auto_increment,
    produto varchar(250) not null,
    quantidade int not null,
    valor decimal(10,2) not null
);

-- descrição da tabela
describe carrinho;

-- CRUD Create
insert into carrinho(produto,quantidade,valor)
values ('Caneta bc CX 30','10','17.50');
insert into carrinho(produto,quantidade,valor)
values ('Borracha CX 15','08','13.50');
insert into carrinho(produto,quantidade,valor)
values ('Caderno CX 10','06','25.30');
insert into carrinho(produto,quantidade,valor)
values ('Estojos CX 15','05','18.90');
insert into carrinho(produto,quantidade,valor)
values ('Apontador CX 35','12','30.50');




-- CRUD Read
-- selecionar todos os registros(dados) da tabela 
select * from carrinho;

-- Operaçoes matematicas no banco de dados 
select sum(valor * quantidade) as total from carrinho;


---------
create table estoque(
codigo int primary key auto_increment,
barcode varchar(50) unique,
produto varchar(100) not null,
fabricante varchar(100) not null,
datacad timestamp default current_timestamp, -- hora automatica.
dataval date not null,      -- date (tipos de dados relacionados a data)
quantidade int not null,
estoquemin int not null,
medida varchar(50) not null,
valor decimal(10,2),
loc varchar(100)         
);
describe estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('caneta BIC azul','BIC',20221005,100,10,'CX',28.75,'setor A p2');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Mochila Dell','Dell',20221005,50,5,'UNID',86.99,'setor B P4');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Caderno','Tilibra',20221005,200,5,'CX',127.99,'setor C P7');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Corretivo','BIC',20210905,300,30,'CX',89.90,'setor B P8');
select * from estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values('NoteBook Dell','DELL',20221006,30,80,'UNID',1899.90,'Setor H P1');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values('BolachaRecheada','Trakinas','20210526',200,300,'CX',65.90,'Setor Alimentos');




-- inventario do estoque(total)
select sum(quantidade * valor) as total from estoque;

-- relatorio de reposição do estoque 1
select * from estoque where quantidade < estoquemin;
-- relatorio de reposição do estoque 2
-- date reset
--  %D (dia) %m(mes) %y(ano) ( ano 2 digitos) %Y (ANO 4 DIGITOS
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,quantidade,estoquemin as estoque_mínimo
from estoque where quantidade < estoquemin;

-- Relatorio de validades dos produtos 1 ( validade dos produtos)
select codigo,produto,date_format(dataval,'%d%m%Y') as data_validade
from estoque;

-- Relatorio de validade dos produtos 2
select codigo as código, produto, 
date_format(dataval,'%d%m%Y') as data_validade,
datediff(dataval,curdate())as dias_restantes
from estoque;

----------------------
update estoque set valor = 44.50 where codigo=1;
update estoque set produto ='Caneta Faber',fabricante ='faber' where codigo=1;


select * from estoque;















