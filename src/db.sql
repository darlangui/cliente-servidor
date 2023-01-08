create table if not exists memoria(
	id int not null primary key auto_increment,
    taxa double,
    tempo timestamp not null default current_timestamp
);

create table if not exists processador(
	id int not null primary key auto_increment,
    taxa double,
    tempo timestamp not null default current_timestamp
);

create table if not exists disco_rigido(
	id int not null primary key auto_increment,
    taxa double,
    tempo timestamp not null default current_timestamp
);

create table if not exists processos(
	id int not null primary key auto_increment,
    nome varchar(255),
    tempo timestamp not null default current_timestamp
);

create table if not exists ip(
	id int not null primary key auto_increment,
    ip varchar(255),
    tempo timestamp not null default current_timestamp
);