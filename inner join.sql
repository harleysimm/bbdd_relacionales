create table departamentos
(id int not null PRIMARY KEY,
 name varchar (20));
 
 create table empleados 
 (id int not null PRIMARY KEY,
  name varchar (20),
  id_departamento int not null,
  FOREIGN KEY (id_departamento)
  references departamentos(id));
  
  insert into departamentos 
  values (1, 'Soporte'), (2, 'TI');
  
  insert into empleados 
  values(1, 'Rodrigo', 1), (2, 'Valeria', 1), (3, 'Miguel', 2);
  
  SELECT empleados.name as empleado_name, departamentos.name as departamento_name
  from empleados
  inner join departamentos on empleados.id_departamento = departamentos.id
  
select members.firstname, facilities.name
  from members 
  inner join bookings on members.memid = bookings.memid
  inner join facilities on facilities.facid = bookings.facid
  
select *
  from members 
  inner join bookings on members.memid = bookings.memid
  inner join facilities on facilities.facid = bookings.facid
  where facilities.name = 'Pool Table'
  and members.recommendedby is not null
  
  