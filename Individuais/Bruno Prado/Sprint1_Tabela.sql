create database Sprint1;
use Sprint1;

-- Criando tabela Dados
create table Dados (
idTemp int primary key auto_increment,
Temperatura decimal(10,2) not null,
data  datetime default current_timestamp
);

-- Inserindo valor na tabela
Insert into Dados (Temperatura)
values ('22');

-- Consultando valores em formato extenso
select
	concat
    ('A temperatura atual está a ',temperatura, ' Graus Celcius, no dia e hora ',data,'.') 
	Temperatura from Dados where idTemp = 1;

-- Consultar todos os dados na tabela
select * from Dados;

-- Criando tabela de Login
create table Login (
idCliente int primary key auto_increment,
user varchar (30),
email varchar(50),
password varchar(30),
empresa varchar (20)
);

-- Inserindo valor na tabela
insert into Login (user, email, password, empresa)
values ('Bruno','bruno.daraujo@sptech.school','bruno12345', 'SpTech School');

-- Consultando valores em formato extenso
select
	concat
    ('O user ',user, ', da empresa ',empresa,', tem com email ', email, ' e sua senha é ', password, '.') 
    Cadastro from Login where idCliente = 1;

-- Consultar todos os dados na tabela
select * from Login;

-- Criando tabela Carnes
create table Carnes (
idCarne int primary key auto_increment,
NomeCarne varchar (25) unique not null,
tempIdeal decimal(10,2) not null,
valorQuilo decimal(10,2) not null,
salaArmazenada int,
key ix_sala (salaArmazenada)
);

-- Inserindo valores na tabela
insert into Carnes (NomeCarne, tempIdeal, valorQuilo, SalaArmazenada)
values ('Ancho', '2.5', '60', '3');

-- Consultando valores em formato extenso
select
	concat
    ('A carne ', NomeCarne, ' tem a sua temperatura ideal de ',tempIdeal,' 
    Graus Celcios, seu valor por quilo é de R$',valorQuilo,', e a sala Armazenada é a ',SalaArmazenada,'.') 
    Carne from Carnes where idCarne = 1;

-- Consultar todos os dados na tabela
select * from Carnes;

-- Criando tabela Salas
create table Salas (
idSala int,
constraint fk_sala foreign key(idSala) references Carnes(salaArmazenada),
fkCarnes varchar (25),
constraint fk_carnes foreign key(fkCarnes) references Carnes(NomeCarne),
tamanho decimal(10,2),
tempSala decimal(10,2)
);

-- Inserindo valores na tabela
insert into Salas (idSala, fkCarnes, tamanho, tempSala)
values ('3', 'Ancho', '40', '-1.5');

-- Consultando valores em formato extenso
select
	concat
    ('A sala ',idSala, ' armazena a carne ',fkCarnes,', e tem sua temperatura base em '
    ,tempSala,' Graus Celcius, e seu tamanho ',tamanho,' metros quadrados.' ) 
    Sala_Configuracao from Salas where idSala = 3;
    
-- Consultar todos os dados na tabela
select * from Salas;
