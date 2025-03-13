create database sprint1;

use sprint1;

create table infoCarnes (
idCarne int auto_increment primary key,
nomeCarne varchar(20) not null,
temperatura decimal not null,
tempoFora int
);

insert into infoCarnes (nomeCarne, Temp_C°, tempoFora)
values  ("picanha", '3', 2),
		("filé_mignon", '2', 2),
        ("contrafilé", '2', 2),
        ("alcatra", '1', 2),
        ("patinho", '0', 2);
        
select * from infoCarnes;

create table login (
idCliente int auto_increment primary key,
nomeCliente varchar(30),
email varchar(40),
senha varchar(40)
);

insert into login (nomeCliente, email, senha)
values ('Guilherme', 'guilherme.molle@sptech.school', '12345678');

select * from login;