select * from libros
select * from editoriales

UPDATE libros
SET precio = precio + (precio * 0.3)
FROM editoriales
WHERE libros.codigoeditorial = editoriales.codigo and libros.codigoeditorial = 14

delete from editoriales
-- where codigo = 13 or codigo = 15 or codigo = 16 --
where codigo in (5,6,11)

insert into editoriales 
values (5, 'For Dummies')

insert into libros 
values (6, 'Filosofia', 'Andrew Soto', 5, 18.99)

DELETE FROM libros
USING editoriales
WHERE libros.codigoeditorial = editoriales.codigo and libros.codigoeditorial = 5

create table employees(
	id int not null primary key,
	name varchar (10), 
	boss_id int not null
)

insert into employees values (1, 'Sebastian', 4), (2, 'Marcial', 4), (3, 'Rodrigo', 4), (4, 'Marysabel', 4)

select * from employees
where boss_id in (select id from employees where id = 4)

select boss.name as nombre_jefe, empleados.name as subalterno
from employees as empleados
inner join employees as boss on empleados.boss_id = boss.id


-- group by para sacar el amount total, diccionario de datos que hace cada dato

