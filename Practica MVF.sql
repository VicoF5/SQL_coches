--Creo el esquema 
create schema schema_coches authorization gvrjjayb;


--Creo las tablas Aux  y sus constraints
-- Modelo
create table schema_coches.modelo (
	idmodelo varchar(200) not null, --PK --nombre del modelo
	marca varchar(200) not null,
	grupo_empresarial varchar(200) not null
);

alter table schema_coches.modelo
add constraint modelo_PK primary key (idmodelo);


-- Color
create table schema_coches.color (
	idcolor varchar(50) not null, --PK --código númerico
	nombre varchar(200) not null
);

alter table schema_coches.color
add constraint color_PK primary key (idcolor);


-- Compañía Aseguradora
create table schema_coches.cia_aseguradora (
	idcia_aseguradora varchar(50) not null, --PK -- cod. abrev.
	nombre varchar(200) not null
);

alter table schema_coches.cia_aseguradora
add constraint cia_aseguradora_PK primary key (idcia_aseguradora);


-- Moneda
create table schema_coches.moneda (
	idmoneda varchar(50) not null, --PK --código númerico
	nombre varchar(200) not null
);

alter table schema_coches.moneda
add constraint moneda_PK primary key (idmoneda);



-- Creo Tabla Coches y sus constraints
create table schema_coches.coche(
	id_coche varchar(200) not null, --PK
	idmodelo varchar(200) not null, --FK
	idcolor varchar(50) not null, --FK
	idcia_aseguradora varchar(50) not null, --FK
	num_poliza integer not null,
	matricula varchar(50) not null,
	kms_totales integer not null,
	dt_compra date not null,
	description varchar(512) null
);

alter table schema_coches.coche
add constraint coche_PK primary key(id_coche);


alter table schema_coches.coche
add constraint coche_FK1 foreign key(idmodelo)
references schema_coches.modelo(idmodelo); 


alter table schema_coches.coche
add constraint coche_FK2 foreign key(idcolor)
references schema_coches.color (idcolor);

alter table schema_coches.coche
add constraint coche_FK3 foreign key(idcia_aseguradora)
references schema_coches.cia_aseguradora (idcia_aseguradora);



-- Creo la tabla Revision
create table schema_coches.revision (
	id_coche varchar(200) not null, --PK, FK
	dt_revision date not null,  --PK
	idmoneda varchar(50) not null, -- FK
	importe_revision integer not null,
	kms_revision integer not null,
	description varchar(512) null
);


alter table schema_coches.revision
add constraint revision_PK primary key(id_coche, dt_revision);


alter table schema_coches.revision
add constraint revision_FK1 foreign key(id_coche)
references schema_coches.coche(id_coche); 


alter table schema_coches.revision
add constraint revision_FK2 foreign key(idmoneda)
references schema_coches.moneda (idmoneda);





-- Inserto datos tablas auxiliares


insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Z4','BMW','BMW Group');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('X2','BMW','BMW Group');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Serie4','BMW','BMW Group');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('MiTo','Alfa Romeo','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Giulietta','Alfa Romeo','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('500','Fiat','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Panda','Fiat','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Tipo','Fiat','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Punto','Fiat','FCA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('C5','Citroën','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('C1','Citroën','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Berlingo','Citroën','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('308','Peugeot','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('3008','Peugeot','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Corsa','Opel','PSA');
insert into schema_coches.modelo (idmodelo, marca, grupo_empresarial) values('Astra','Opel','PSA');


insert into schema_coches.color (idcolor, nombre) values('1','Rojo');
insert into schema_coches.color (idcolor, nombre) values('2','Azul');
insert into schema_coches.color (idcolor, nombre) values('3','Amarillo');
insert into schema_coches.color (idcolor, nombre) values('4','Verde ');
insert into schema_coches.color (idcolor, nombre) values('5','Negro');
insert into schema_coches.color (idcolor, nombre) values('6','Blanco');
insert into schema_coches.color (idcolor, nombre) values('7','Gris');


insert into schema_coches.cia_aseguradora (idcia_aseguradora, nombre) values('AXA','Axa Seguros');
insert into schema_coches.cia_aseguradora (idcia_aseguradora, nombre) values('MAP','Mapfre');
insert into schema_coches.cia_aseguradora (idcia_aseguradora, nombre) values('LD','Línea Directa');
insert into schema_coches.cia_aseguradora (idcia_aseguradora, nombre) values('ZUR','Zurich');
insert into schema_coches.cia_aseguradora (idcia_aseguradora, nombre) values('ALZ','Allianz');


insert into schema_coches.moneda (idmoneda, nombre) values('EUR','Euro');
insert into schema_coches.moneda (idmoneda, nombre) values('USD','Dólar estadounidense');
insert into schema_coches.moneda (idmoneda, nombre) values('GBP','Libra esterlina');
insert into schema_coches.moneda (idmoneda, nombre) values('JPY','Yen');
insert into schema_coches.moneda (idmoneda, nombre) values('CNY','Yuan');


-- Inserto datos BD empresa KC

--coches

insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('1','X2','4','AXA','123456','CAB1030','30000','2020-01-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('2','MiTo','6','MAP','123457','CAB1031','10500','2019-06-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('3','Punto','3','LD','123458','CAB1032','5000','2020-01-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('4','Corsa','1','ZUR','123459','CAB1033','100','2022-06-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('5','Astra','7','ALZ','123460','CAB1034','100000','2018-01-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('6','Panda','2','MAP','123461','CAB1035','150000','2019-06-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('7','Serie4','5','LD','123462','CAB1036','3000','2022-06-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('8','3008','3','ZUR','123463','CAB1037','50000','2020-01-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('9','500','7','ALZ','123464','CAB1038','1000','2022-06-01','');
insert into schema_coches.coche (id_coche, idmodelo, idcolor, idcia_aseguradora, num_poliza, matricula, kms_totales, dt_compra, description) values('10','Giulietta','1','AXA','123465','CAB1039','9800','2022-06-01','');


--revisiones

insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('1','2020-12-01','EUR','100','10000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('1','2021-12-01','EUR','120','20000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('2','2020-12-01','EUR','100','10000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('5','2018-12-01','EUR','80','30000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('5','2019-12-01','EUR','90','50000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('5','2020-12-01','EUR','100','70000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('5','2021-12-01','EUR','120','90000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('6','2019-12-01','USD','95','30000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('6','2020-12-01','USD','105','50000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('6','2021-12-01','USD','125','70000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('8','2019-12-01','USD','95','10000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('8','2020-12-01','USD','105','20000','');
insert into schema_coches.revision (id_coche, dt_revision, idmoneda, importe_revision,kms_revision, description) values('8','2021-12-01','USD','125','30000','');




-- Visualizo
--select * from schema_coches.coche

--select * from schema_coches.revision hr 
