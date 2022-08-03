create schema intelitech;
use intelitech;

create table proveedores
(
   pro_id_proveedor int primary key auto_increment,
   nit varchar(100) unique,
   nombre varchar(200) not null,
   telefono varchar(100) null,
   direccion varchar(100) not null
);

create table productos
(
   pr_codigo int primary key,
   pr_descripcion varchar(100),
   pr_precio_unitario bigint,
   pro_id_proveedor int,
   foreign key (pro_id_proveedor) references proveedores(pro_id_proveedor)
);

create table clientes
(
  cl_id_cliente int primary key,
  cl_codigo varchar(10) unique,
  cl_nombre varchar(100) not null,
  cl_apellido varchar(100) not null,
  cl_email varchar(100) not null,
  cl_celular varchar(100) not null,
  cl_fecha_nacimiento date not null
);

create table cotizaciones
(
  cl_id_cliente int,
  pr_codigo int,
  co_codigo varchar(10) unique,
  co_cantidad int,
  co_fecha datetime,
  primary key (cl_id_cliente, pr_codigo),
  foreign key (cl_id_cliente) references clientes(cl_id_cliente),
  foreign key (pr_codigo) references productos(pr_codigo)
);


INSERT INTO proveedores
(
nit,
nombre,
telefono,
direccion)
VALUES
('9125089610',
'Norma',
'325132154',
'Calle 70b # 100 -15'),
('9005123545',
'Prisma Color',
'3127153654',
'Carrera 100 # 80 -15');


INSERT INTO productos
(pr_codigo,
pr_descripcion,
pr_precio_unitario,
pro_id_proveedor)
VALUES
(100,
'Cuaderno 100 hojas',
2000,
1),
(200,
'Cuaderno 50 hojas',
1000,
1),
(300,
'Caja de colores por 50',
50000,
2),
(400,
'Lápiz negro',
1000,
1);



INSERT INTO clientes
(cl_id_cliente,
cl_codigo,
cl_nombre,
cl_apellido,
cl_email,
cl_celular,
cl_fecha_nacimiento)
VALUES
(1,
'20',
'Miguel Enrique',
'Soto Varela',
'miguelsoto@gmail.com',
'3006681894',
'1992-02-01'),
(2,
'21',
'Maria Camila',
'Medina Salas',
'mmedina@gmail.com',
'65132151321',
'1994-08-30');

INSERT INTO cotizaciones
(cl_id_cliente,
pr_codigo,
co_codigo,
co_cantidad,
co_fecha)
VALUES
(1,
100,
'1',
5,
'2022-08-01 20:00:00'),
(2,
400,
'2',
7,
'2022-08-01 17:00:00');

update productos set pr_precio_unitario = 60000 where pr_codigo = 300;
update clientes set cl_celular = '3007408338' where cl_id_cliente = 1;
delete from cotizaciones where co_codigo = '2';



