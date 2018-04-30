USE sakila;
#1a. Display the first and last names of all actors from the table actor

SELECT *FROM actor;

SELECT actor.first_name, actor.last_name
FROM actor;

#1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.#
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS `Actor Name`
FROM actor;

# 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
#What is one query would you use to obtain this information?
SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.first_name LIKE  'Joe';

#2b. Find all actors whose last name contain the letters GEN:
SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.last_name LIKE '%GEN%';

-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name,
--  in that order:
SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.last_name LIKE '%LI%'
ORDER BY actor.last_name ASC;

-- 2d. Using IN, display the country_id and country columns of the following countries: 
-- Afghanistan, Bangladesh, and China:
SELECT *FROM country;

SELECT  country.country_id, country.country
FROM country 
WHERE country IN ("Afghanistan", "Bangladesh", "China");

-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. 
-- Hint: you will need to specify the data type.
ALTER TABLE actor
ADD middle_name  VARCHAR(20)
AFTER first_name;

SELECT *FROM actor;

-- 3b. You realize that some of these actors have tremendously long last names. 
-- Change the data type of the middle_name column to blobs.
ALTER TABLE actor
MODIFY middle_name  BLOB;

SELECT *FROM actor;
-- 3c. Now delete the middle_name column.
ALTER TABLE actor
DROP middle_name;

SELECT *FROM actor;

-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name,
COUNT(*) as count FROM actor
GROUP BY last_name 
ORDER BY count DESC;

-- 4b. List last names of actors and the number of actors who have that last name, but only for names
-- that are shared by at least two actors
SELECT last_name,
COUNT(*) as count FROM actor
GROUP BY last_name 
HAVING count >=2
ORDER BY count DESC;
-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
-- the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.first_name LIKE 'GROUCHO' and actor.last_name LIKE 'WILLIAMS';

UPDATE actor
SET first_name='HARPO'
WHERE actor_id = 172;

SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.first_name LIKE 'HARPO' and actor.last_name LIKE 'WILLIAMS';

-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was
--  the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO.
--  Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
--  BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! 
--  (Hint: update the record using a unique identifier.)
SELECT  actor.actor_id,actor.first_name, actor.last_name
FROM actor
WHERE actor.first_name LIKE 'HARPO' and actor.last_name LIKE 'WILLIAMS';

UPDATE actor
SET first_name =  'GROUCHO'
WHERE actor_id = 172;


-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?  
SHOW CREATE TABLE address;

-- Output 

-- 'CREATE TABLE `address` (
--   `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
--   `address` varchar(50) NOT NULL,
--   `address2` varchar(50) DEFAULT NULL,
--   `district` varchar(20) NOT NULL,
--   `city_id` smallint(5) unsigned NOT NULL,
--   `postal_code` varchar(10) DEFAULT NULL,
--   `phone` varchar(20) NOT NULL,
--   `location` geometry NOT NULL,
--   `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   PRIMARY KEY (`address_id`),
--   KEY `idx_fk_city_id` (`city_id`),
--   SPATIAL KEY `idx_location` (`location`),
--   CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8'

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:

SELECT*FROM address;

SELECT*FROM staff;

SELECT staff.first_name, staff.last_name, staff.address_id, address.address, address.address_id
FROM staff
INNER JOIN address ON
staff.address_id = address.address_id;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
SELECT*FROM payment;

SELECT*FROM staff;

SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS 'total_rung_up'
FROM staff
INNER JOIN payment ON
staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name;

-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
SELECT*FROM film_actor;

SELECT*FROM film;

SELECT  film.title, COUNT(film_actor.film_id) AS num_of_actors
FROM film
INNER JOIN  film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.title;

-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT*FROM inventory;
SELECT*FROM film;

SELECT  film.title, COUNT(inventory.inventory_id) AS num_of_copies
FROM film
INNER JOIN  inventory 
ON film.film_id = inventory .film_id
WHERE film.title LIKE '%Hunchback Impossible%'
GROUP BY film.title;

-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name: 
SELECT*FROM payment;
SELECT*FROM customer; 

SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS 'total_paid'
FROM customer
INNER JOIN payment ON
customer.customer_id = payment.customer_id 
GROUP BY customer.first_name, customer.last_name
ORDER BY customer.last_name ASC;

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
SELECT actor_id
FROM film_actor
WHERE film_id = (
SELECT film_id
FROM film
WHERE title =  "Alone Trip")
);

-- 7c. You want to run an email marketing campaign in Canada,
-- for which you will need the names and email addresses of all Canadian customers. 
-- Use joins to retrieve this information.
SELECT*FROM customer; 
SELECT*FROM address ; 
SELECT*FROM city; 
SELECT*FROM country;

SELECT  customer.first_name, customer.last_name, customer.email, country.country
FROM customer 
	JOIN  address
		ON address.address_id = customer.address_id 
	JOIN city
		ON city.city_id = address.city_id
	JOIN country 
		ON country.country_id = city.country_id 
WHERE country.country LIKE 'CANADA';

-- 7d. Sales have been lagging among young families, and you wish to target all
-- family movies for a promotion. Identify all movies categorized as famiy films. 
SELECT * FROM film_category; 
SELECT * FROM film; 
SELECT * FROM category; 

SELECT  film.title, category.name
FROM film
	JOIN  film_category
		ON film_category.film_id = film.film_id
	JOIN category
		ON category.category_id = film_category.category_id
WHERE category.category_id = 8;


-- 7e. Display the most frequently rented movies in descending order.
SELECT * FROM rental;  
SELECT * FROM inventory; 
SELECT * FROM film; 

SELECT  film.title, COUNT(inventory.inventory_id) AS num_of_rentals
FROM rental
	JOIN  inventory 
		ON inventory.inventory_id = rental.inventory_id 
    JOIN film
		ON film.film_id =inventory.film_id
GROUP BY film.title
ORDER BY num_of_rentals DESC;

-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT*FROM payment; 
SELECT*FROM store; 
SELECT*FROM customer; 

SELECT store.store_id  ,SUM(payment.amount) AS 'total_revenue'
FROM store
	JOIN  customer 
		ON store.store_id= customer.store_id
    JOIN payment
		ON payment.customer_id = customer.customer_id 
GROUP BY store.store_id;


-- 7g. Write a query to display for each store its store ID, city, and country.
SELECT*FROM store; 
SELECT*FROM address ; 
SELECT*FROM city; 
SELECT*FROM country; 

SELECT store.store_id, city.city, country.country
FROM store
	JOIN  address
		ON address.address_id = store.store_id
    JOIN city
		ON city.city_id = address.city_id
	JOIN country
		ON country.country_id = city.country_id
GROUP BY store.store_id;
-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

SELECT*FROM category ; 
SELECT*FROM film_category; 
SELECT*FROM inventory ; 
SELECT*FROM payment; 
SELECT*FROM rental; 

SELECT category.name, SUM(payment.amount) AS 'gross_revenue'
FROM category
	JOIN  film_category
		ON film_category.category_id =category.category_id 
    JOIN inventory
		ON inventory.film_id = film_category.film_id
	JOIN rental
		ON rental.inventory_id = inventory.inventory_id 
	JOIN payment
		ON payment.rental_id = rental.rental_id 
GROUP BY category.name
ORDER BY gross_revenue DESC
LIMIT 5 ;

-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue.
-- Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to
-- create a view.
CREATE VIEW top_5_gross_revenue AS
SELECT category.name, SUM(payment.amount) AS 'gross_revenue'
FROM category
	JOIN  film_category
		ON film_category.category_id =category.category_id 
    JOIN inventory
		ON inventory.film_id = film_category.film_id
	JOIN rental
		ON rental.inventory_id = inventory.inventory_id 
	JOIN payment
		ON payment.rental_id = rental.rental_id 
GROUP BY category.name
ORDER BY gross_revenue DESC
LIMIT 5 ;
-- 8b. How would you display the view that you created in 8a?
SELECT*FROM top_5_gross_revenue;
-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
DROP VIEW top_5_gross_revenue;