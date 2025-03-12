create database controlBeef;
use controlBeef;

create table empresas (
	id int primary key auto_increment,
    nome varchar(40) not null,
    telefone varchar(15) not null,
    representante varchar(40) not null,
    email varchar(50) not null unique
);

create table usuario (
	id int primary key auto_increment,
    idEmpresas int,
    email varchar(50) not null,
    senha varchar(200) not null,
    foreign key fk_usuario_empresa (idEmpresas) references empresas(id)
);

create table frigorifico (
	idFrigorifico int primary key auto_increment, 
    idEmpresas int,
    nome varchar(40) not null,
    endereco varchar(60) not null,
    foreign key fk_frigorifico_empresa (idEmpresas) references empresas(id)
);

create table salas (
	id int primary key auto_increment,
    fkFrigorifico int not null,
    idCarnes int not null,
    nome varchar(40) not null, 
    capacidade int not null,
    temperatura int,
    funcionando varchar(15),
    constraint chk_funcionando check(funcionando in('Ativa', 'Inativa')),
    foreign key fk_salas_frigorifico (fkFrigorifico) references frigorifico(idFrigorifico),
    foreign key fk_salas_carnes (idCarnes) references carnes(id)
);


create table carnes (
	id int primary key auto_increment,
	nome varchar(15) not null,
    precoCompra dec(10,2) not null,
    precoVenda dec(10,2) not null,
    temperatura int not null
);

create table sensor (
	id int primary key auto_increment,
    idSalas int not null,
	tempMin dec(5,2) not null,
	tempMax dec(5,2) not null,
    foreign key fk_sensor_salas (idSalas) references salas(id)
);

create table monitoramento (
	id int primary key auto_increment,
    idSensor int not null,
	temperaturaCap dec(5,2),
    data_hora timestamp default current_timestamp,
    foreign key fk_monitoramento_sensor (idSensor) references sensor(id)
);


-- inserção de dados
INSERT INTO empresas (nome, telefone, representante, email) VALUES
('FrigoBeef LTDA', '11999999999', 'Carlos Silva', 'contato@frigobeef.com'),
('Carne Premium', '11988888888', 'Ana Souza', 'ana@carnepremium.com');

INSERT INTO usuario (idEmpresas, email, senha) VALUES
(1, 'admin@frigobeef.com', 'senha123'),
(2, 'gestor@carnepremium.com', 'senha456');

INSERT INTO frigorifico (idEmpresas, nome, endereco) VALUES
(1, 'Frigorífico São Paulo', 'Rua das Carnes, 100 - SP'),
(2, 'Frigorífico Rio Grande', 'Avenida Fria, 200 - RS');

INSERT INTO carnes (nome, precoCompra, precoVenda, temperatura) VALUES
('Picanha', 40.00, 80.00, -2),
('Alcatra', 30.00, 60.00, -3),
('Maminha', 25.00, 50.00, -1);

INSERT INTO salas (fkFrigorifico, idCarnes, nome, capacidade, temperatura, funcionando) VALUES
(1, 4, 'Sala Picanha', 500, 2, 'Ativa'),
(1, 5, 'Sala Alcatra', 600, 2, 'Ativa'),
(2, 6, 'Sala Maminha', 400, 2, 'Ativa');

INSERT INTO sensor (idSalas, tempMin, tempMax) VALUES
(4, -1.0, 4.0),
(5, -1.0, 4.0),
(6, -1.0, 4.0);

INSERT INTO monitoramento (idSensor, temperaturaCap) VALUES
(4, -1.5),
(5, -3.0),
(6, 0.5);

