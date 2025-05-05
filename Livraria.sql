show databases;

-- Criar o banco de dados
CREATE DATABASE Livraria;

-- Usar o banco de dados
USE Livraria;

-- Criar tabelas
CREATE TABLE Cliente (
	idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(20) NOT NULL,
	cpf VARCHAR(14),
    cnpj VARCHAR(18),
    cep VARCHAR(9) NOT NULL,
    PRIMARY KEY(idCliente)
);

CREATE TABLE Autor (
	idAutor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    biografia VARCHAR(500),
    PRIMARY KEY(idAutor)
);

CREATE TABLE Editora (
	idEditora INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    cnpj VARCHAR(14) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY(idEditora)
);

CREATE TABLE Categoria (
	idCategoria INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(500) NOT NULL,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY(idCategoria)
);

CREATE TABLE Transportadora (
	idTransportadora INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    cnpj VARCHAR(18) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    PRIMARY KEY(idTransportadora)
);

CREATE TABLE Livro (
	idLivro INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL UNIQUE,
    descritivo VARCHAR(1000) NOT NULL,
    ano DATE NOT NULL,
    preco DECIMAL NOT NULL,
    idEditora INT NOT NULL,
    PRIMARY KEY(idLivro),
    INDEX fk_Livro_Editora_idx (idEditora ASC),
    FOREIGN KEY(idEditora)
		REFERENCES Livraria.Editora (idEditora) ON DELETE RESTRICT
);

CREATE TABLE Venda (
	idCliente INT NOT NULL,
    idLivro INT NOT NULL,
    numeroNotaFiscal VARCHAR(45) NOT NULL,
    data DATETIME NOT NULL,
    valorTotal FLOAT NOT NULL,
	PRIMARY KEY(numeroNotaFiscal),
    INDEX fk_Venda_Cliente_idx (idCliente ASC),
    INDEX fk_Venda_Livro_idx (idLivro ASC),
    FOREIGN KEY(idCliente)
		REFERENCES Livraria.Cliente (idCliente) ON DELETE RESTRICT,
    FOREIGN KEY(idLivro)
		REFERENCES Livraria.Livro (idLivro) ON DELETE RESTRICT
);

CREATE TABLE Entrega (
	numeroNotaFiscal VARCHAR(45) NOT NULL,
    idTransportadora INT NOT NULL,
    numeroProtocolo INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(numeroProtocolo),
    INDEX fk_Entrega_Venda_idx (numeroNotaFiscal ASC),
    INDEX fk_Entrega_Transportadora_idx (idTransportadora ASC),
    FOREIGN KEY(numeroNotaFiscal)
		REFERENCES Livraria.Venda (numeroNotaFiscal) ON DELETE RESTRICT,
    FOREIGN KEY(idTransportadora)
		REFERENCES Livraria.Transportadora (idTransportadora) ON DELETE RESTRICT
);

CREATE TABLE LivroAutor (
	 idLivro INT NOT NULL,
     idAutor INT NOT NULL,
     idLivroAutor INT NOT NULL AUTO_INCREMENT,
     PRIMARY KEY(idLivroAutor),
     INDEX fk_LivroAutor_Livro_idx (idLivro ASC),
     INDEX fk_LivroAutor_Autor_idx (idAutor ASC),
     FOREIGN KEY(idLivro)
		REFERENCES Livraria.Livro (idLivro) ON DELETE RESTRICT,
	FOREIGN KEY(idAutor)
		REFERENCES Livraria.Autor (idAutor) ON DELETE RESTRICT
);

CREATE TABLE LivroCategoria (
	idLivro INT NOT NULL,
    idCategoria INT NOT NULL,
    PRIMARY KEY(idLivro, idCategoria),
    INDEX fk_LivroCategoria_Livro_idx (idLivro ASC),
    INDEX fk_LivroCategoria_Categoria_idx (idCategoria ASC),
    FOREIGN KEY(idLivro)
		REFERENCES Livraria.Livro (idLivro) ON DELETE RESTRICT,
	FOREIGN KEY(idCategoria)
		REFERENCES Livraria.Categoria (idCategoria) ON DELETE RESTRICT
);

-- Exibir tabelas
show tables;

-- Alterar tabelas
alter table Autor add nomeFantasia VARCHAR(50);
alter table Entrega add meioEntrega VARCHAR(50) NOT NULL;
alter table Autor modify column biografia VARCHAR(1000);
alter table Livro modify column preco DECIMAL(5,2) NOT NULL;

-- Inserir informações
insert into Cliente
values (01, 'Andrisa', 'pf', '033897', null, '97010');
insert into Cliente
values (02, 'Saraiva', 'pj', null, '0404', '97010');

insert into Autor (nome, nacionalidade)
values ('Edgar Allan', 'Britânico');

insert into Categoria
values (1, 'suspense e terror', 'mistério');

insert into Editora
values (1, 'Intrínseca', '0400', 'SP', 'Brasil');

insert into Transportadora
values (001, 'LogSim', '0888', '9400');

insert into Livro
values (001, 'o corvo', 'mistério e terror psicológico', '1830-01-11', 20, 1);

insert into Venda
values (1, 1, '08008', '2025-05-05', 20.5);
insert into Venda
values (2, 1, '04004', '2025-05-07', 200);

insert into Entrega
values ('08008', 1, 404);

insert into LivroAutor
values (1, 1, 1);

insert into LivroCategoria
values (1, 1);