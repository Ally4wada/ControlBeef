CREATE DATABASE ControlBeef;
USE ControlBeef;

CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL ,
    UNIQUE ix_nome (NOME)
);

CREATE TABLE frigorificos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    capacidade INT
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria_id INT,
    frigorifico_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (frigorifico_id) REFERENCES frigorificos(id)
);

CREATE TABLE TemperaturaEstoque(
    id INT PRIMARY KEY AUTO_INCREMENT,
    frigorifico_id INT,
    temperatura DECIMAL(5,2) NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (frigorifico_id) REFERENCES frigorificos(id)
);

DESC categorias;
DESC frigorificos;
DESC produtos;
DESC TemperaturaEstoque;