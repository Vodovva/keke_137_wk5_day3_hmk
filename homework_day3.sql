-- 1. List all customers who live in Texas (use JOINs)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.state = 'Texas';


-- 2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.first_name, c.last_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount > 7.00;



-- 3. Show all customer names who have made over $175 in payments (use subqueries)
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT p.customer_id
    FROM payment p
    GROUP BY p.customer_id
    HAVING SUM(p.amount) > 175
);



-- 4. List all customers that live in Argentina (use the city table)
SELECT cu.customer_id, cu.first_name, cu.last_name
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country_name = 'Argentina';



-- 5. Show all the film categories with their count in descending order
SELECT cat.name, COUNT(fc.film_id) AS film_count
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY film_count DESC;



-- 6. What film had the most actors in it (show film info)?
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY actor_count DESC
LIMIT 1;



-- 7. Which actor has been in the least movies?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count ASC
LIMIT 1;



-- 8. Which country has the most cities?
SELECT co.country_name, COUNT(ci.city_id) AS city_count
FROM country co
JOIN city ci ON co.country_id = ci.country_id
GROUP BY co.country_name
ORDER BY city_count DESC
LIMIT 1;



-- 9. List the actors who have been in between 20 and 25 films.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) BETWEEN 20 AND 25;


