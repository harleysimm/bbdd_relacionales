create table customer
(CustomerId int not null,
 CustomerName varchar(40),
 ContactName varchar(30),
 Address varchar(30),
 City varchar(20),
 PostalCode int,
 Country varchar(20),
 primary key(CustomerId) 
);
 
create table orders(  
	 OrderId int not null,
	 CustomerId int, 
	 EmployeeID int,
	 OrderDate date,
	 ShipperID INT,
	 primary key (OrderId),
	foreign key (CustomerId) references customer(CustomerId));

-- Insert full --
	 
insert into customer(CustomerId, CustomerName, ContactName, Address, City,
 PostalCode, Country) 
	values('123456', 'Sebastian Castro', 'Rafael Castro', 'Quebrada el manzano 168', 'Lampa', '900000', 'Chile'); 
insert into customer(CustomerId, CustomerName, ContactName, Address, City,
 PostalCode, Country) 
	values('123457', 'Gabriela Castro', 'Soledad Infante', 'Fray Camilo Henriquez 255', 'Santiago', '907000', 'Chile');
-- Insert sin campos --
insert into customer
	values('123458', 'Leonardo Ponce', 'Sergio Ponce', 'Burgos 155', 'Las Condes', '903000', 'Chile');

-- Insert omitiendo campos --
insert into customer(CustomerId, CustomerName, ContactName, Address, City, Country) 
	values('123459', 'Sandra Vilches', 'Marco Castro', 'Lo seco 240', 'Colina', 'Chile');
		
select * from customer



-- Insert a partir de una subquery --

Insert into editoriales (nombre)
select autor
from libros
where precio > 45

Select * from editoriales
Select * from libros

-- Actualizar datos --
update libros set precio = precio + (precio * 0.20)  where codigo = 4

update editoriales set nombre = 'Feminismo Verde' where codigo = 6