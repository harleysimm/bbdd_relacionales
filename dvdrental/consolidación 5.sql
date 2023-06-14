--Construye las siguientes consultas:
-- Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.
insert into customer(customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, active)
	values(600, 2, 'Sebastian','Castro', 'sebastiancastro.vilches@gmail.com', 416, true,'2023-06-10',1)

insert into staff(staff_id, first_name, last_name, address_id, email, store_id, active, username)
	values(3,'Leonardo', 'Ponce', 10, 'Leonardo.Ponce@sakilastaff.com', 1, true, 'Leo')
	
insert into actor(actor_id, first_name, last_name)
	values(201, 'Penelope', 'Cruz')
	
update customer set first_name = 'Marysabel' where customer_id = 1

update staff set first_name = 'Miguel', username = 'Miguel' where staff_id = 1

update actor set first_name = 'Nicholas', last_name = 'Cage' where actor_id = 2

delete from customer
where customer_id = 600

delete from staff
where staff_id =3

delete from actor
where actor_id = 201

-- Listar todas las “rental” con los datos del “customer” dado un año y mes.

select concat(customer.first_name, ' ', customer.last_name) as customer_name, film.title as film_title, rental.rental_date as date 
from rental
inner join customer on rental.customer_id = customer.customer_id
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
where rental.rental_date >= '2005-06-01' and rental.rental_date < '2005-07-01'
group by customer_name, film_title, date 
order by rental_date ASC

-- Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

select
    payment_id as Numero,
    cast(payment_date as date) as Fecha,
    amount as Total
from
    payment

-- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0

select film.title as film_title, cast(rental.rental_date as date) as rental_date, film.rental_rate
from film	
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
where extract(year from rental.rental_date) = 2006 and film.rental_rate > 4.0
order by film_title ASC

select * from customer where active <> 1

