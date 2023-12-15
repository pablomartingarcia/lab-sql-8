-- 1
select title, length, row_number() over (order by length desc) as `rank` from film
where length is not null and length > 0;

-- 2
select title, length, rating, row_number() over (partition by rating order by length desc) as `rank` from film
where length is not null and length > 0;

-- 3
select c.name as category, count(f.category_id) as film_count
from category c
join film_category f on c.category_id = f.category_id
group by c.category_id, c.name;

-- 4
select a.actor_id, a.first_name, a.last_name, count(*) as film_count
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
order by film_count desc
limit 1;

-- 5
select c.customer_id, c.first_name, c.last_name, count(*) as rental_count
from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id, c.first_name, c.last_name
order by rental_count desc
limit 1;

-- BONUS
select f.film_id, f.title, count(*) as rental_count
from film f
join inventory i on f.film_id = i.film_id
join rental r ON i.inventory_id = r.inventory_id
group by f.film_id, f.title
order by rental_count desc
limit 1;