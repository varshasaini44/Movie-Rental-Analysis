use mavenmovies;
#Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names.
SELECT 
    TRIM(CONCAT(first_name,space(1), last_name)) AS actor_name,
    CHAR_LENGTH(REPLACE(CONCAT(first_name, last_name), space(1),space(1)))AS name_length
FROM  actor
LIMIT 10;

----- #List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
SELECT 
    TRIM(CONCAT(a.first_name, ' ', a.last_name)) AS full_name,
    CHAR_LENGTH(CONCAT(a.first_name, a.last_name)) AS name_length
FROM  actor a
INNER JOIN actor_award aa ON a.actor_id = aa.actor_id
WHERE aa.awards="Oscar";


#3. ind the actors who have acted in the film ‘Frost Head.’
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM  actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
WHERE f.title = 'Frost Head';

#4.Pull all the films acted by the actor ‘Will Wilson.’

SELECT f.film_id,f.title
FROM  film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Will' AND a.last_name = 'Wilson';

#5.Pull all the films which were rented and return them in the month of May.
SELECT f.film_id,f.title
FROM film f
INNER JOIN
    inventory i ON f.film_id = i.film_id
INNER JOIN
    rental r ON i.inventory_id = r.inventory_id
WHERE
    MONTH(r.rental_date) = 5
AND MONTH(r.return_date) = 5;

#6 Pull all the films with ‘Comedy’ category.
SELECT f.film_id, f.title
FROM film f
INNER JOIN
    film_category fc ON f.film_id = fc.film_id
INNER JOIN
    category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy';






















