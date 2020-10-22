CREATE TABLE paises(
CODIGO	   integer primary key,
PAIS       varchar(50) not null,
DDI        varchar(5),
SIGLA      varchar(3),
MOEDA      varchar(3),
DATACAD    Date,
DATAULTALT Date 
);

CREATE TABLE estados(
CODIGO     integer primary key,
ESTADO     varchar(50) not null,
UF         varchar(2),
COD_PAIS   integer not null,
DATACAD    Date,
DATAULTALT Date, 
FOREIGN KEY (COD_PAIS) REFERENCES paises(CODIGO)
);

CREATE TABLE cidades(
CODIGO     integer primary key,
CIDADE     varchar(50) not null,
DDD        varchar(3), 
SIGLA      varchar(3),
COD_ESTADO integer not null,
DATACAD    Date,
DATAULTALT Date, 
FOREIGN KEY (COD_ESTADO) REFERENCES estados(CODIGO)
);