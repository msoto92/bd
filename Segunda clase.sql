create schema clase_bd;
use clase_bd;

create table generos
(
  ge_id_genero int primary key,
  ge_descripcion varchar(100)
);

insert into generos (ge_id_genero, ge_descripcion)  
values (1, 'Masculino'),(2,'Femenino');

insert into generos(ge_id_genero, ge_descripcion)
values (3,'Otros');

select *
from generos;

create table usuarios
(
  us_id_usuario int primary key,
  us_nombre varchar(100) not null,
  us_apellido varchar(100) not null,
  us_password varchar(100) not null,
  us_username varchar(100) not null,
  us_fecha_nacimiento date null,
  us_telefono varchar(100) null,
  ge_id_genero int not null,
  foreign key (ge_id_genero) references generos(ge_id_genero)
);

insert into usuarios(us_id_usuario, us_nombre, us_apellido, us_password, us_username, us_telefono, ge_id_genero)
values (1, 'Raul', 'Cordoba','Clave.12345','rcordoba','315712354', 1),
       (2, 'Juan', 'Perez','Clave_12345','jperez','31254513', 1);
       
insert into usuarios(us_id_usuario, us_nombre, us_apellido, us_password, us_username, us_telefono, ge_id_genero, us_fecha_nacimiento)
values (3, 'Laura', 'Ruiz', 'lruiz.1234','lruiz','315321535',2,'1992-08-01');

select  us_nombre nombre, us_apellido apellido, us_telefono
from usuarios u
order by us_ultimo_accesos;

update usuarios set us_telefono = '315321534' where us_id_usuario = 3;

delete from usuarios where us_id_usuario = 3;

alter table usuarios add column us_ultimo_acceso TIMESTAMP;
alter table usuarios rename column us_ultimo_acceso to us_ultimo_accesos;
alter table usuarios drop column us_ultimo_acceso;

select *
from usuarios;

update usuarios set us_ultimo_accesos = '2022-08-01 21:05:00' where us_id_usuario = 1;
update usuarios set us_ultimo_accesos = '2022-08-01 21:06:00' where us_id_usuario = 2;
update usuarios set us_ultimo_accesos = now() where us_id_usuario = 1;

drop table usuarios;
