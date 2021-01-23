--1.Join the film to the film_actor table.
select * from film F
join film_actor FA on FA.film_id = F.film_id

--2.Join the actor table to the film_actor table. 
select * from actor ACT
join film_actor FA on FA.actor_id = ACT.actor_id

--3.Try to join the actor, film_actor, and film table together (3 joins!)
select * from actor ACT
join film_actor FA on FA.actor_id = ACT.actor_id
join film F on F.film_id = FA.film_id