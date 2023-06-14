-- cuenta todas las ciudades aunque estén repetidas --
select count(city) from customers

-- cuenta las ciudades que sean "distintas" o sea cuenta valores únicos --
select count(distinct city) from customers

select distinct city from customers order by 1

select distinct city, country from customers order by 2