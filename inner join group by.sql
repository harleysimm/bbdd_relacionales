-- Listar todos los productos comprados por el cutsomer con id  = 90
select customers.customername, products.productname,
orderdetails.quantity, products.price, 
products.price * orderdetails.quantity as amount from products
inner join orderdetails on products.productid = orderdetails.productid
inner join orders on orderdetails.orderid = orders.orderid
inner join customers on customers.customerid = orders.customerid
where customers.customerid = 90
-- Listar todos los productos vendidos por vendedor
SELECT concat(employees.firstname, ' ' , employees.lastname) as name, products.productname,
orderdetails.quantity, products.price, products.price * orderdetails.quantity as amount
FROM employees
INNER JOIN orders ON employees.employeeid = orders.employeeid
INNER JOIN orderdetails ON orders.orderid = orderdetails.orderid
INNER JOIN products ON orderdetails.productid = products.productid
ORDER BY employees.firstname, employees.lastname, products.productname ASC, amount DESC



SELECT concat(employees.firstname, ' ' , employees.lastname) as name, orders.orderdate, SUM(products.price * orderdetails.quantity) as amount, count(orders.orderid)
FROM employees
INNER JOIN orders ON employees.employeeid = orders.employeeid
INNER JOIN orderdetails ON orders.orderid = orderdetails.orderid
INNER JOIN products ON orderdetails.productid = products.productid
GROUP BY name, orders.orderdate
ORDER by name, orders.orderdate

SELECT concat(employees.firstname, ' ' , employees.lastname) as name, 
	MAX(products.price * orderdetails.quantity) as amount_max,	
	MIN(products.price * orderdetails.quantity) as amount_min
FROM employees
INNER JOIN orders ON employees.employeeid = orders.employeeid
INNER JOIN orderdetails ON orders.orderid = orderdetails.orderid
INNER JOIN products ON orderdetails.productid = products.productid
GROUP BY name

-- Tarea Listado del suppliers con su avg de ventas

SELECT suppliers.suppliername, 
ROUND(AVG(products.price * orderdetails.quantity),2) as AverageVentas
from suppliers
INNER JOIN products ON suppliers.supplierid = products.supplierid
INNER JOIN orderdetails ON products.productid = orderdetails.productid
GROUP BY suppliers.suppliername


