use libreria;

create table Clientes
(
  id_cliente int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(30),
  apellido varchar(30),
  cedula int
);

create table Editoriales
(
 id_editorial int AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(30)
);

create table Autores
(
  id_autores int AUTO_INCREMENT PRIMARY KEY,
  codigo int,
  nacionalidad varchar(30),
  fecha_nacimiento date
);

create table Libros
(
  id_libro int AUTO_INCREMENT PRIMARY KEY,
  codigo varchar(10) ,
  titulo varchar(100),
  isbn varchar(30),
  numero_paginas int,
  id_editorial int,
  foreign key (id_editorial) references Editoriales(id_editorial)
);

create table Ventas
(
  id_venta int auto_increment primary key,
  fecha_compra date,
  numero_factura varchar(30),
  id_libro int,
  id_cliente int,
  foreign key (id_libro) references Libros (id_libro),
  foreign key (id_cliente) references Clientes(id_cliente)
);

create table Libros_autores
(
  id_libro int,
  id_autores int,
  primary key(id_libro, id_autores),
  foreign key (id_libro) references Libros(id_libro),
  foreign key (id_autores) references Autores(id_autores)
);
