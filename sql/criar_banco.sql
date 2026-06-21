CREATE DATABASE financeiro_varejo;
USE financeiro_varejo;

CREATE TABLE clientes ( 
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    segmento ENUM('Pessoa Física', 'Pessoa Jurídica'),
    data_cadastro DATE
);

CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    custo DECIMAL(10,2),
    preco_venda DECIMAL(10,2)
);

CREATE TABLE vendas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    forma_pagamento ENUM('À Vista', 'Parcelado', 'Boleto'),
    status ENUM('Paga', 'Pendente', 'Atrasada', 'Cancelada'),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
	id INT PRIMARY KEY AUTO_INCREMENT,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE despesas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_despesa DATE,
    categoria VARCHAR(50),
    descricao VARCHAR(100),
    valor DECIMAL(10,2)
);

