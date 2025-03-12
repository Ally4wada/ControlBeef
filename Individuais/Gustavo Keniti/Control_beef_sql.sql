create database control_beef;
use control_beef;

create table login (idLogin int not null primary key auto_increment,
usuario varchar(15) not null,
email varchar(30) not null,
senha varchar(20) not null 
);

create table salas (idSala int primary key auto_increment,
nome_sala varchar(100) not null,
localizacao varchar(255) not null,
temperatura_maxima int not null,
temperatura_minima int not null,
fk_usuario int not null,
constraint fk_sala foreign key(fk_usuario) references login(idLogin)
);

create table carnes (id int not null primary key auto_increment,
nome varchar(15) not null,
categoria varchar(15) not null default 'bovina',
peso dec(10,2) not null,
preco dec(10,2) not null,
validade date not null,
fk_sala int not null,
temperatura_ideal varchar(50) not null,
index ix_sala (fk_sala),
constraint fk_carne foreign key(fk_sala) references salas(idSala),
constraint chk_categoria check(categoria = 'bovina')
);

insert into login (usuario, email, senha)
	values ('keniti', 'gustavo.keniti@sptech.school', 'keniti123');
    
insert into salas (nome_sala, localizacao, temperatura_maxima, temperatura_minima, fk_usuario)
	values ('beefs', 'paulista', '4', '-3', 1);
    
insert into carnes (nome, categoria, peso, preco, validade, fk_sala, temperatura_ideal)
	values ('picanha', 'bovina', '25.50', '305.50', '2025-09-28', '1', '0');

select * from login;
desc login;
select * from salas;
desc salas;
select * from carnes;
desc carnes;