/**
	Agenda de contatos
    @author Henrique Morais Teixeira
*/
-- exibir banco de dados do servidor 
show databases;
-- Criar um novo banco de dados 
create database dbagenda;
-- excluir um banco de dados 
drop database dbteste;
-- selecionar o banco de dados 
use dbagenda;
-- verificar tabelas existentes 
show tables;

-- Criando uma tabela 
-- Toda tabela precisa ter uma chave primária (PK)
-- int (tipo de dados -> números inteiros)
-- Primary key -> transforma este campo em chave primária
-- auto_increment -> numeração automática
-- varchar (tipo de dados equivalente a String) 
-- (50) numero maximo de caracteres 
-- not null -> preenchimento obrigatorio 
-- unique -> não permite valores duplicados na tabela
create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela
describe contatos;

-- alterar o nome do campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo(coluna) a tabela 
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) em um local especifico da tabela 
alter table contatos add column fone2 varchar(15) after fone;

-- modificar o tipo de dados e/ou validação na caluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela 
alter table contatos drop column obs;

-- excluir a tabela contatoscontatos
drop table contatos;

-- CRUD (Create Read Update Delete)
-- operações básicas do banco de dados 

-- CRUD Create 
insert into contatos(nome,fone,email)
values ('Gabriel Santana','94706-3723','gspadovesi@gmail.com');
insert into contatos(nome,fone,email)
values ('osvaldo1','99999-9999','osvaldo@gmail.com');
insert into contatos(nome,fone,email)
values ('Henrique Moraes','24242-2424','henrique.vintequatro@gmail.com');
insert into contatos(nome,fone,email)
values ('Pedro Tucano','12233-1213','pedro.tucano@gmail.com');
insert into contatos(nome,fone,email)
values ('Lucas araujo','2743-6809','lucas.souza@gmail.com');
insert into contatos(nome,fone) 
values('Daniel','1234-5678');

 

-- CRUD Read
-- selecionar todos os registros(dados) da tabela 
select * from contatos;

-- selecionar contatos especificos da tabela 
select nome, fone from contatos;

-- selecionar colunas em ordem crescente e decrescente 
select * from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id = 5;
select * from contatos where id = 1;
select * from contatos where nome = 'Henrique Moraes';
select * from contatos where nome like 'H%';

-- CRUD Update 
-- ATENÇAO ! Nao esuqeça do where
update contatos set email='palemirassmundial@gmail.com' where id = 1;
update contatos set fone='98534425' where id = 4;
update contatos set nome='Daniel Dias' where id = 6;

-- CRUD DELETE
-- ATENÇAO!!! Nao esqueça do where e usar sempre o id para evitar problemas
delete from contatos where id=1;





















