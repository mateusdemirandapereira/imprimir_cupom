create database real_bingo;

use real_bingo;
delete from cupons;
drop table if exists cupons;
create table if not exists cupons (
    codigo int not null primary key auto_increment,
    pedido int not null check (pedido > 0) unique,
    data date not null,
    valor numeric(8,2) not null check(valor > 0),
    metodoPagamento varchar(255) not null,
    quantidade int not null check(quantidade > 0),
    cliente int not null,
    nome varchar(255) not null,
    cpf varchar(255) not null,
    telefone_fisco varchar(255),
    telefone_celular varchar(255),
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    cep varchar(255) not null,
    estado varchar(255) not null,
    usuario int not null,
    dataEmissao date not null default now(),
    foreign key (usuario) references usuarios (codigo));
    
    
    alter table cupons add foreign key (usuario) references usuarios (codigo);

desc cupons;

select * from cupons;
select * from usuarios;
drop table usuarios;
create table if not exists usuarios(
	codigo int not null primary key auto_increment,
    nome varchar(255) not null,
    snome varchar(255) not null,
    email varchar(255) not null unique,
    senha varchar(255) not null,
    tipo tinyint not null default 0
);



select * from cuponsClientes;
delete from cuponsClientes;
drop table if exists cuponsClientes;
create table if not exists cuponsClientes(
codigo int not null primary key auto_increment,
codigoCupom int not null,
cliente int not null,
pedido int not null,
valor numeric(8,2) not null,
data date not null,
foreign key (codigoCupom) references cupons (codigo)
);





