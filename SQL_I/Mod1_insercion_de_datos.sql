____INSERCIÓN DE DATOS____


__1- Lo primero que vamos a hacer es insertar datos en nuestra BBDD con los siguientes datos:

USE tienda_zapatillas;

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ("XQYUN", "Negro", "Nike", 42),
("pQYUN", "Rosa", "Nike", 35), ("OPNYT","Verdes",
"Adidas",35);

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ("Laura", "Alcobendas", 25.987, '2010/09/03'),
("Maria","Sevilla", 0,'2001/04/11'),("Ester","Oviedo",30165.98,'2000/11/29'); 

INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ("Monica", 1234567289, "monica@email.com", "Calle Felicidad", "Mostoles", "Madrid", 28176),
("Lorena",289345678,"lorena@email.com","Calle Alegria","Barcelona","Barcelona",12346),
("Carmen",298463759,"carmen@email.com","Calle del Color","Vigo","Pontevedra",23456) ;

INSERT INTO facturas (numero_factura, fecha, id_zapatillas, id_empleado, id_cliente, total)
VALUES (123, "2001-11-12", 1,2,1, 54.98), (1234,'2005-05-23',1,1,3,89.91), (12345,'2015-09-18',2,3,3,76.23); 

__2- De nuevo nos hemos dado cuenta que hay algunos errores en la inserción de datos. 
__En este ejercicio los actualizaremos para que nuestra BBDD esté perfectita.

º Tabla zapatillas
_En nuestra tienda no vendemos zapatillas rosas...¿Cómo es posible que tengamos zapatillas de color rosa? 
_En realidad esa zapatillas son amarillas.

UPDATE zapatillas
SET color = 'amarillas'
WHERE color = 'rosa';

º Tabla empleados
_Laura ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña.

UPDATE empleados
SET tienda = 'A Coruña'
WHERE tienda = 'Alcobendas';

º Tabla clientes
_El número de teléfono de Mónica está mal!!! Metimos un dígito de más. En realidad su número es: 123456728.

UPDATE clientes
SET numero_telefono = 123456728
WHERE numero_telefono = 1234567289;

º Tabla facturas
_El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es 89,91.

UPDATE facturas
SET total = 89.91
WHERE total = 76.23;