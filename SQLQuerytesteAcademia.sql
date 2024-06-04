create database academia

use academia

create table cidade (
	codigo smallint not null
	constraint PK_cidade PRIMARY KEY,
	nome varchar(30) not null
	constraint UN_nome UNIQUE,
	estado char(2) not null,
	pais char(3) not null
	)

create table unidade(
	codunidade smallint not null
	constraint PK_codunidade PRIMARY KEY,
	endereco varchar(40) not null,
	admini varchar(40) not null
	constraint UN_admini UNIQUE,
	numero varchar(11) not null,
	horario_de_funcionamento tinyint not null
	constraint UN_hora_funcionario UNIQUE,
	codparceria smallint not null
	constraint UN_codparceria UNIQUE

	)

create table parceria(
	codparceria smallint not null
	constraint PK_codparceria PRIMARY KEY,
	nome varchar(40) not null
	constraint UN_nome_parceria UNIQUE,
	contato varchar(40) not null,
	tipoparceria varchar(20) not null,
	codunidade smallint not null
	constraint FK_codunidade FOREIGN KEY REFERENCES unidade(codparceria)
	)

create table plano(
	preco smallmoney not null
	constraint PK_plano_preco PRIMARY KEY,
	modalidade varchar(30) not null,
	horario varchar(10) not null,
	desconto smallmoney
	)


create table cliente(
	nome varchar(40) not null
	constraint UN_nome_cliente UNIQUE,
	numero varchar(11),
	email varchar(50),
	cpf varchar(12) not null
	constraint PK_cpf PRIMARY KEY,
	mensalidade varchar(4) not null,
	cidade smallint not null
	constraint FK_cidade_cliente FOREIGN KEY REFERENCES cidade(codigo),
	plano smallmoney not null
	constraint FK_preco_plano FOREIGN KEY REFERENCES plano(preco)
	)

create table funcionario(
	nome varchar(40) not null
	constraint UN_nome_funcionario UNIQUE,
	email varchar(40) not null,
	numero varchar(11),
	matricula smallint not null
	constraint PK_matricula PRIMARY KEY,
	horario tinyint not null
	constraint FK_horario FOREIGN KEY REFERENCES unidade(horario_de_funcionamento)
	)

create table fichadeTreino(
	exercicio varchar(40) not null,
	funcionario smallint not null
	constraint FK_funcionario_matricula FOREIGN KEY REFERENCES funcionario(matricula),
	serie varchar(10) not null,
	grupo_muscular varchar(25) not null
	)

create table funcao(
	nome varchar(40) not null
	constraint UN_nome_funcao UNIQUE,
	codigo tinyint not null
	constraint PK_codigo PRIMARY KEY,
	osb text,
	tipo varchar(20) not null
	)

create table horario (
	horario tinyint not null
	constraint FK_horario_unidade FOREIGN KEY REFERENCES unidade(horario_de_funcionamento),
	dia varchar(15) not null,
	tipo varchar(20) not null,
	obs text
	)

create table fornecedor (
	produto varchar(40) not null,
	tipo tinyint not null,
	nome_da_empresa varchar(30) not null
	constraint PK_nome_empresa PRIMARY KEY,
	telefone varchar(10) not null,
	email varchar(40)
	constraint UN_fornecedor_email UNIQUE
	)

create table tipo(
	codigo tinyint not null
	constraint PK_codigo_tipo PRIMARY KEY,
	validade varchar(10) not null,
	nome varchar(30) not null
	constraint UN_nome_produto UNIQUE,
	quantidade smallint not null
	)

create table produto(
	quantidade smallint not null,
	tipo tinyint not null
	constraint FL_tipo_produto FOREIGN KEY REFERENCES tipo(codigo),
	nome varchar(30) not null
	constraint UN_nome_produto UNIQUE,
	quantidade_minima smallint not null,
	fornecedor varchar(30) not null
	constraint FK_nome_fornecedor FOREIGN KEY REFERENCES fornecedor(nome_da_empresa),
	valor_de_venda smallmoney not null,
	valor_de_compra smallmoney not null
	)

create table pedido(
	codpedido varchar(50) not null
	constraint PK_cod_pedido PRIMARY KEY,
	cliente varchar(12) not null
	constraint FK_cliente FOREIGN KEY REFERENCES cliente(cpf),
	produto varchar(30) not null
	constraint FK_nome_produto FOREIGN KEY REFERENCES produto(nome),
	valor_total_ smallmoney not null,
	forma_de_pagamento varchar(15) not null,
	funcionario smallint not null
	constraint FK_funcionario FOREIGN KEY REFERENCES funcionario(matricula),
	data smalldatetime not null
	)