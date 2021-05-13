USE sakila;
SHOW TABLES;
DESCRIBE actor;

SELECT * FROM actor;
SELECT a.first_name, a.last_name FROM actor a WHERE a.first_name = "John";

SELECT * FROM actor a WHERE a.last_name = "Neeson";

SELECT * FROM actor a WHERE a.actor_id % 10 = 0;

SELECT * FROM film;
SELECT f.description FROM film f WHERE f.film_id = 100;

SELECT * FROM film f WHERE f.rating = "R";

SELECT * FROM film f WHERE f.rating != "R";

SELECT * FROM film f ORDER BY f.length LIMIT 10;

SELECT * FROM film f WHERE f.special_features LIKE "Deleted Scenes";

SELECT * FROM film_category;
SELECT * FROM category;
SELECT * FROM film;

SELECT f.title, c.name 
FROM film_category fc 
JOIN category c ON fc.category_id = c.category_id 
JOIN film f ON f.film_id = fc.film_id 
WHERE fc.category_id = 11;


SELECT * FROM language;
SELECT l.name FROM language l ORDER BY l.name DESC;

SELECT * FROM actor;
SELECT a.first_name, a.last_name FROM actor a WHERE a.last_name LIKE "%son%" ORDER BY a.first_name;

SELECT a.last_name, COUNT(a.last_name) FROM actor a GROUP BY a.last_name HAVING COUNT(a.last_name) = 1 ORDER BY a.last_name DESC;

SELECT * FROM film_actor;
SELECT * FROM film;
SELECT * FROM actor;
-- SELECT a.first_name, a.last_name, COUNT(a.actor_id) 
-- FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id 
-- JOIN film f ON fa.film_id = f.film_id 
-- GROUP BY a.first_name HAVING COUNT(a.actor_id) >100;

SELECT a.actor_id, a.first_name, COUNT(*) as c
FROM actor a
join film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY c DESC
LIMIT 1;