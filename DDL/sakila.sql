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