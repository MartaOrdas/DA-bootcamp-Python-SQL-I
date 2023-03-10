
___________CONSULTAS BÁSICAS 2______________

__ Conociendo el tipo de productos que vendemos en Northwind:
__ 1. Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre 
__ de dichos productos y sus precios.

USE northwind;

SELECT product_name, unit_price
FROM products
ORDER BY product_id
LIMIT 10;

__ 2. Ordenando los resultados:
__ Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.

SELECT product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

__ 3. Qué pedidos tenemos en nuestra BBDD:
__ Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. 
__ Nos interesa conocer qué pedidos distintos hemos tenido (eliminando entradas duplicadas según su ID
__ en la tabla order_details).

SELECT DISTINCT order_id
FROM order_details;


__ 4. Los dos primeros pedidos:
__Cómo el número de pedidos es demasiado alto para visualizarlo de manera práctica en la consulta anterior,
__vamos a limitar los resultados sólo a los 2 primeros pedidos para verlos más en detalle. 
__ Sin embargo , en la tabla orderDetails pueden existir varios registros para cada pedido, 
__por lo que no nos servirá con un uso normal del comando LIMIT.

SELECT DISTINCT order_id
FROM order_details
LIMIT 2;

__ 5. Qué pedidos han gastado más:
__Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer
__los 3 pedidos que han supuesto un mayor coste económico total para la empresa.
__Calcúlalo y dale alias ImporteTotal. Nota: Utiliza unit_price y quantity.

SELECT order_id, unit_price * quantity AS ImporteTotal
FROM order_details
LIMIT 3;

__ 6. Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:
__ Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de
__ los pedidos situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.

SELECT order_id
FROM order_details
ORDER BY unit_price * quantity AS ImporteTotal
LIMIT 10
OFFSET '4';

__ 7- Qué categorías tenemos en nuestra BBDD:
   _De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías que 
   _componen los tipos de pedido de la empresa. Queremos que la lista de resultado sea renombrada como
   _"NombreDeCategoria".
   
   SELECT category_id AS NombreDeCategoria
   FROM products;
   
   
__8 - Selecciona envios con retraso:
-Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. 
-Últimamente se están dando retrasos en muchas entregas y por ello se busca realizar la acción
-preventiva de enviar los paquetes con varios días adicionales de antelacion. Para comenzar a planear 
-esos envíos anticipados, nos piden conocer cuál sería la fecha de envío (ShippedDate) de los pedidos
-almacenados en la base de datos, si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva 
-fecha renombrada como FechaRetrasada.
💡-Pista: Para realizar lo anterior, busca documentación de la función DATE_ADD para MySQL.

SELECT DATE_ADD(`shipped_date`, INTERVAL 5 DAY) AS `FechaRetrasada`
FROM orders;


__ 9- Selecciona los productos más rentables:
   _ Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado que el rango de 
   _productos que puede dar más beneficios parece ser el de aquellos con un precio mayor o igual a 15 
   _dólares, pero menor o igual que 50 dólares. Selecciona los datos de ese rango de productos usando el 
   _operador BETWEEN.
   
   SELECT product_id
   FROM products
   WHERE unit_price BETWEEN 15 AND 50;
   
__ 10- Selecciona los productos con unos precios dados:
   _Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20
   _dólares (un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un 
   _futuro). Usa IN para conseguirlo de manera eficiente.
   
   SELECT