create database Sprint1;
use Sprint1;

create table Dados (
idTemp int primary key auto_increment,
Temperatura Decimal not null,
data  datetime default current_timestamp
);

Insert into Dados (Temperatura)
values ('22');

select
	concat('A temperatura atual está a ',temperatura, ' Gruas Celcius, no dia e hora ',data,'.') Temperatura
from Dados;

select * from Dados;

create table Login (
idCliente int primary key auto_increment,
user varchar (30),
email varchar(50),
password varchar(30)
);

insert into Login (user, email, password)
values ('Bruno','bruno.daraujo@sptech.school','bruno12345');

select * from Login;

select
	concat('O user ',user, ' tem como email ', email, ' e sua senha é ', password, '.') Cadastro
from Login where idCliente = 1;
