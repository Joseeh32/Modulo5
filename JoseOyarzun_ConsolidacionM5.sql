-- Parte 1: Insertar, modificar y eliminar un Customer, Staff y Actor
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (1, 'Jessica', 'Aniston', 'jessica.aniston@mail.com', 5, TRUE, NOW(), NOW(), 1);

UPDATE customer
SET first_name = 'Pepe', last_name = 'Mujica', email = 'pepe.mujica@mail.com', last_update = NOW()
WHERE customer_id = 1;

DELETE FROM customer
WHERE customer_id = 1;

INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
VALUES ('Jose', 'Oyarzun', 3, 'jose.o@mail.com', 1, TRUE, 'JoseO32', '123456', NOW(), null);

UPDATE staff
SET first_name = 'Pablo', last_name = 'Silva', email = 'psilva@mail.com', last_update = NOW()
WHERE staff_id = 1;

DELETE FROM staff
WHERE staff_id = 1;

INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Leonardo', 'Dicaprio', NOW());

UPDATE actor
SET first_name = 'Paris', last_name = 'Hilton', last_update = NOW()
WHERE actor_id = 1;

DELETE FROM actor
WHERE actor_id = 1;

-- Parte 2: Listar todas las "rental" con los datos del "customer" dado un año y mes
SELECT r.rental_id, r.rental_date, r.return_date, c.customer_id, c.first_name, c.last_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2005
AND EXTRACT(MONTH FROM r.rental_date) = 5;

SELECT * FROM rental;

-- Parte 3: Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
SELECT payment_id, payment_date, amount
FROM payment;

-- Parte 4: Listar todas las "film" del año 2006 que contengan un (rental_rate) mayor a 4.0
SELECT film_id, title, rental_rate
FROM film
WHERE release_year = 2006
AND rental_rate > 4.0;

-- Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente
SELECT 
    table_name AS "tabla",
    column_name AS "columna",
    is_nullable AS "puede ser Nulo",
    data_type AS "tipo de dato"
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public'