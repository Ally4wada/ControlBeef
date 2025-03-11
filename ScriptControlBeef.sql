drop database if exists ControlBeef;

create database ControlBeef;

use ControlBeef;

create table Endereco(
idEndereco int primary key auto_increment,
logradouro varchar(100),
bairro varchar(45),
numero varchar(45),
cep char(9)
);

insert into Endereco (logradouro, bairro, numero, cep) values 
('Rua das Flores', 'Centro', '123', '12345-678'),
('Avenida Brasil', 'Jardim das Rosas', '456', '98765-433');

select * from Endereco;

create table Empresa(
idEmpresa int primary key auto_increment,
cnpj char(14),
nomeFantasia varchar(50),
razaoSocial varchar(50),
email varchar(50),
telefone varchar(20),
fkEndereco int,
foreign key (fkEndereco) references Endereco(idEndereco)
);

insert into Empresa values
(null, '12345678901234', 'Swift', 'JBS S/A', 'swift@gmail.com', '11987234561', 1);

select * from Empresa;

create table Funcionario(
idFuncionario int primary key auto_increment,
nome varchar(50),
telefone varchar(20),
email varchar(50),
senha varchar(50),
cargo varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
);

insert into Funcionario values
(null, 'Felipe','11939005850', 'felipe@gmail.com', '12345678', 'Analista - Senior', 1),
(null, 'Gustavo','11998019050', 'gustavo@outlook.com', '123456789', 'Analista - Junior', 1),
(null, 'Eduardo','11939005850', 'eduardo@hotmail.com', '123456', 'Gestor', 1);

select * from Funcionario;

create table Frigorifico(
idFrigorifico int primary key auto_increment,
tipoFrigorifico varchar(50),
qtdSalas int,
statusFrigorifico varchar(50),
capacidadeTotalKilos int,
dataUltimaManutencao date,
fkEndereco int,
fkEmpresa int,
foreign key (fkEndereco) references Endereco(idEndereco),
foreign key (fkEmpresa) references Empresa(idEmpresa),
constraint chk_tipo check(tipoFrigorifico in ('Comercial', 'Industrial', 'Armazenagem')),
constraint chk_status check(statusFrigorifico in ('Ativo', 'Em manuntenção', 'Inoperante'))
);

insert into Frigorifico values
(null, 'Comercial', 10, 'Inoperante', 1000, '2025-02-02', 2, 1),
(null, 'Industrial', 15, 'Em manuntenção', 1500, '2025-02-06', 2, 1),
(null, 'Armazenagem', 20, 'Ativo', 2000, '2025-02-27', 2, 1);

select * from Frigorifico;

create table Sala(
idSala int primary key auto_increment,
temperaturaMax int,
temperaturaMin int,
qtdSensores int, 
capacidadeKilos int,
fkFrigorifico int, 
foreign key (fkFrigorifico) references Frigorifico(idFrigorifico)
);

insert into Sala values
(null, 5, -3, 2, 100, 1), 
(null, 4, -3, 2, 150, 1), 
(null, 3, -4, 2, 100, 2),
(null, 4, -4, 2, 125, 2),
(null, 5, -4, 2, 150, 2),
(null, 4, -3, 2, 100, 3),
(null, 3, -4, 2, 120, 3),
(null, 4, -3, 2, 140, 3),
(null, 5, -2, 2, 160, 3);

select * from Sala;

create table CorteCarneBovina(
idCorte int primary key auto_increment,
nomeCorte varchar(50),
precoKilo int,
temperaturaMax int,
temperaturaMin int
);

insert into CorteCarneBovina values
(null, 'Picanha', 90, 4, -2),
(null, 'Alcatra', 80, 3, -3),
(null, 'Wagyu', 100, 4, -3);

select * from CorteCarneBovina;

create table EstoqueSala(
idEstoqueSala int primary key auto_increment,
qtdKilosCarne int,
fkSala int, 
fkCorteCarneBovina int,
foreign key (fkSala) references Sala(idSala),
foreign key (fkCorteCarneBovina) references CorteCarneBovina(idCorte)
);

insert into EstoqueSala values 
(null, 160, 1, 2),
(null, 200, 1, 1),
(null, 156, 2, 3),
(null, 64, 2, 1),
(null, 56, 2, 2),
(null, 114, 3, 3),
(null, 103, 3, 2),
(null, 127, 4, 2),
(null, 177, 4, 1),
(null, 199, 5, 2),
(null, 116, 6, 3),
(null, 175, 6, 1),
(null, 135, 6, 2),
(null, 75, 7, 2),
(null, 110, 7, 3),
(null, 168, 8, 3),
(null, 75, 8, 2),
(null, 142, 8, 1),
(null, 139, 9, 3),
(null, 151, 9, 1),
(null, 104, 9, 2);

select * from EstoqueSala;

create table Sensor(
idSensor int primary key auto_increment,
fkSala int,
foreign key (fkSala) references Sala(idSala)
);

insert into Sensor values
(null, 1),
(null, 1),
(null, 2),
(null, 3),
(null, 3),
(null, 3),
(null, 4),
(null, 4),
(null, 5),
(null, 6),
(null, 7),
(null, 7),
(null, 8),
(null, 9);

select * from Sensor;

create table DadosSensor(
idDado int primary key auto_increment,
tempRegistrada int,
dtHoraTemperatura datetime default current_timestamp,
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);

insert into DadosSensor values
(null, -5, '2025-02-01 08:23:45', 1),
(null, 7, '2025-02-01 09:17:30', 1),
(null, 3, '2025-02-02 10:45:12', 1),
(null, 9, '2025-02-02 14:35:10', 1),
(null, 12, '2025-02-03 16:40:52', 1),
(null, 4, '2025-02-03 17:05:21', 2),
(null, 1, '2025-02-04 06:55:30', 2),
(null, 6, '2025-02-04 08:20:12', 2),
(null, 8, '2025-02-05 11:12:34', 2),
(null, 13, '2025-02-05 15:45:10', 2),
(null, -3, '2025-02-06 06:30:30', 3),
(null, 4, '2025-02-06 07:45:50', 3),
(null, 6, '2025-02-07 09:15:18', 3),
(null, 14, '2025-02-07 11:50:22', 3),
(null, 10, '2025-02-08 13:20:02', 3),
(null, 0, '2025-02-08 14:30:40', 4),
(null, 8, '2025-02-09 16:45:15', 4),
(null, 11, '2025-02-09 17:50:05', 4),
(null, 2, '2025-02-10 06:05:00', 4),
(null, 7, '2025-02-10 08:25:10', 4),
(null, 9, '2025-02-11 10:50:50', 5),
(null, 12, '2025-02-11 11:35:25', 5),
(null, 15, '2025-02-12 12:40:05', 5),
(null, 10, '2025-02-12 14:10:30', 5),
(null, 6, '2025-02-13 09:05:10', 5),
(null, 3, '2025-02-13 10:30:00', 6),
(null, 4, '2025-02-14 11:25:15', 6),
(null, 2, '2025-02-14 13:45:45', 6),
(null, 8, '2025-02-15 07:15:10', 6),
(null, 11, '2025-02-15 12:35:50', 6),
(null, 10, '2025-02-16 08:05:30', 7),
(null, 6, '2025-02-16 09:40:10', 7),
(null, 3, '2025-02-17 06:25:05', 7),
(null, 1, '2025-02-17 07:50:15', 7),
(null, 7, '2025-02-18 11:10:00', 8),
(null, 4, '2025-02-19 11:25:15', 9),
(null, 2, '2025-02-19 13:45:45', 9),
(null, 8, '2025-02-20 07:15:10', 10),
(null, 11, '2025-02-20 12:35:50', 11),
(null, 10, '2025-02-20 08:05:30', 11),
(null, 6, '2025-02-21 09:40:10', 12),
(null, 3, '2025-02-21 06:25:05', 13),
(null, 1, '2025-02-22 07:50:15', 14),
(null, 7, '2025-02-23 11:10:00', 14);

create table Alerta(
    idAlerta int primary key auto_increment,
    tipoAlerta varchar(20),
    statusAlerta varchar(20),
    dtHoraAlerta datetime default current_timestamp,
    fkSensor int,
    foreign key (fkSensor) references Sensor(idSensor),
    constraint chk_tipoAlerta check (tipoAlerta in ('Alta temperatura', 'Baixa temperatura')),
    constraint chk_statusAlerta check (statusAlerta in ('Resolvido', 'Não resolvido'))
);

-- Inserindo os alertas para os sensores que possuem temperaturas acima de 4 graus
insert into Alerta (tipoAlerta, statusAlerta, dtHoraAlerta, fkSensor) values
('Alta temperatura', 'Não resolvido', '2025-02-01 09:17:30', 1),
('Alta temperatura', 'Resolvido', '2025-02-02 14:35:10', 1),
('Alta temperatura', 'Não resolvido', '2025-02-03 16:40:52', 1),
('Alta temperatura', 'Não resolvido', '2025-02-05 15:45:10', 2),
('Alta temperatura', 'Resolvido', '2025-02-05 15:45:10', 2),
('Alta temperatura', 'Não resolvido', '2025-02-07 11:50:22', 3),
('Alta temperatura', 'Não resolvido', '2025-02-08 13:20:02', 3),
('Alta temperatura', 'Resolvido', '2025-02-11 10:50:50', 5),
('Alta temperatura', 'Não resolvido', '2025-02-12 12:40:05', 5),
('Alta temperatura', 'Não resolvido', '2025-02-15 12:35:50', 6),
('Alta temperatura', 'Resolvido', '2025-02-16 09:40:10', 7),
('Alta temperatura', 'Não resolvido', '2025-02-17 07:50:15', 7),
('Alta temperatura', 'Não resolvido', '2025-02-18 11:10:00', 8),
('Alta temperatura', 'Não resolvido', '2025-02-20 07:15:10', 10),
('Alta temperatura', 'Resolvido', '2025-02-20 12:35:50', 11),
('Alta temperatura', 'Resolvido', '2025-02-21 09:40:10', 12),
('Alta temperatura', 'Resolvido', '2025-02-23 11:10:00', 14);

-- Inserindo os alertas para os sensores com temperaturas abaixo de -3 graus
insert into Alerta (tipoAlerta, statusAlerta, dtHoraAlerta, fkSensor) values
('Baixa temperatura', 'Não resolvido', '2025-02-01 08:23:45', 1),
('Baixa temperatura', 'Resolvido', '2025-02-06 06:30:30', 3),
('Baixa temperatura', 'Não resolvido', '2025-02-10 06:05:00', 4),
('Baixa temperatura', 'Resolvido', '2025-02-13 10:30:00', 6),
('Baixa temperatura', 'Não resolvido', '2025-02-17 06:25:05', 7),
('Baixa temperatura', 'Não resolvido', '2025-02-21 06:25:05', 13),
('Baixa temperatura', 'Não resolvido', '2025-02-22 07:50:15', 14);

select * from Alerta;

-- Consulta que mostra o id do dado e qual foi a temperatura e a data/hora que foi registrada essa temperatura, qual foi o sensor que capturou esse dado e em qual sala ele estava, qual o id do frigorifico dessa
-- sala e informacoes desse frigorifico como tipo e capacidade, qual a empresa dona desse frigorifico com informacoes dessa empresa e qual o endereco dessa empresa.
select 
    ds.idDado as 'ID do Dado',
    ds.tempRegistrada as 'Temperatura Registrada',
    ds.dtHoraTemperatura as 'Data Hora Temperatura',
    s.idSensor as 'ID Sensor',
    s.fkSala as 'Sala do Sensor',
    f.idFrigorifico as 'ID Frigorífico',
    f.tipoFrigorifico as 'Tipo de Frigorífico',
    f.capacidadeTotalKilos as 'Capacidade Total Frigorífico (Kilos)',
    e.idEmpresa as 'ID Empresa',
    e.nomeFantasia as 'Nome Fantasia Empresa',
    e.email as 'Email Empresa',
    en.idEndereco as 'ID Endereço Empresa',
    en.logradouro as 'Logradouro Endereço',
    en.bairro as 'Bairro Endereço',
    en.numero as 'Número Endereço',
    en.cep as 'CEP Endereço'
from DadosSensor as ds
join Sensor as s on ds.fkSensor = s.idSensor
join Sala as sa on s.fkSala = sa.idSala
join Frigorifico as f on sa.fkFrigorifico = f.idFrigorifico
join Empresa as e on f.fkEmpresa = e.idEmpresa
join Endereco as en ON e.fkEndereco = en.idEndereco;







