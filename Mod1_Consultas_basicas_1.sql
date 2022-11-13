#1-Conociendo a las empleadas: Crea una consulta que tenga los campos employee_id, last_name y first_name.
USE northwind;

SELECT employee_id, last_name, first_name
FROM employees;

#2- Conociendo los productos más baratos: queremos ver aquellos productos (tabla productos) cuyos precios por unidad se encuentren entre 0 y 5 dólares, 
#Es decir, los productos más baratos
SELECT product_id
FROM products
WHERE unit_price >= 0 AND unit_price <= 5;

#3- Conociendo los productos de los que queramos maximizar ventas: 
# Queremos también conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares
#(Un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro).

SELECT *
FROM products
WHERE unit_price >= 18 OR unit_price <= 20

#4- Conociendo los productos que dan más beneficios:
# Estos podrían ser los que valen entre 15 y 50 dólares, por lo que estos son los que seleccionaremos.

SELECT *
FROM products
WHERE unit_price >= 15 OR unit_price <= 50

#5- Conociendo los productos que no tienen precio:
#Para comprobar si los datos en la tabla products están correctos, 
#nos interesa seleccionar aquellos productos que no tengan precio, 
#porque lo hayan dejado vaciío al introducir los datos (NULL).

SELECT *
FROM products
WHERE unit_price IS NULL


#6- Comparando productos:
#Ahora obten los datos de aquellos productos con un precio menor a 15 dólares, 
#pero sólo aquellos que tienen un ID menor que 10 (para tener una muestra significativa 
#pero no tener que ver todos los productos existentes).

SELECT *
FROM products
WHERE unit_price < 15
AND product_id < 10;


#7- Cambiando de operadores:
#Ahora vamos a hacer la misma consulta que en el ejercicio anterior pero con los límites de valor a la inversa.

SELECT *
FROM products
WHERE unit_price > 15
AND product_id > 10;

#8 - Conociendo los países a los que vendemos:
# A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio 
#en esas regiones y al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. 
#Realiza una consulta para obtener ese dato.

SELECT ship_country
FROM orders;
