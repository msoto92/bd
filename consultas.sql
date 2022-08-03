SELECT 'Consulta 1';

SELECT DISTINCT p.nombre
FROM proveedores AS P
JOIN productos as pr
  ON p.pro_id_proveedor = pr.pro_id_proveedor
ORDER BY p.nombre; 

SELECT 'Consulta 2';

SELECT p.nombre,
       pr.pr_precio_unitario,
       pr.pr_descripcion
FROM proveedores AS P
JOIN productos AS pr
  ON p.pro_id_proveedor = pr.pro_id_proveedor
WHERE pr.pr_precio_unitario > 10000;  
SELECT 'Consulta 3';
SELECT pr.pr_descripcion,
	   pr.pr_precio_unitario
FROM productos AS pr
WHERE pr.pro_id_proveedor = 2;
SELECT 'Consulta 4';
SELECT pr.pr_descripcion
FROM productos AS pr
JOIN cotizaciones AS c
  ON pr.pr_codigo = c.pr_codigo
JOIN clientes as cl
  ON cl.cl_id_cliente = c.cl_id_cliente
WHERE cl.cl_codigo = 20  
ORDER BY pr.pro_id_proveedor;
SELECT 'Consulta 5';
SELECT CONCAT(cl.cl_nombre, ' ' , cl.cl_apellido) AS nombre_completo
FROM clientes cl
JOIN cotizaciones c
  on cl.cl_id_cliente = c.cl_id_cliente
JOIN productos pr
  on pr.pr_codigo = c.pr_codigo
WHERE pr.pr_descripcion like '%Cuaderno 100 hojas%'  ;
SELECT 'Consulta 6';
SELECT count(pr.pro_id_proveedor) as cantidad
FROM productos pr
WHERE pr.pr_precio_unitario > 40000 ;
SELECT 'Consulta 7';
SELECT SUM(c.co_cantidad * pr.pr_precio_unitario)
FROM productos pr
JOIN cotizaciones c
  ON pr.pr_codigo = c.pr_codigo
JOIN clientes cl
  ON cl.cl_id_cliente = c.cl_id_cliente
WHERE cl.cl_nombre = 'Maria Camila' and cl.cl_apellido = 'Medina Salas';

