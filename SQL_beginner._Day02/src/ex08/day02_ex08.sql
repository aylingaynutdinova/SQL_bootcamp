-- SELECT name from person
-- JOIN person_order
-- ON person.id = person_order.person_id
-- JOIN menu
-- ON menu.id = person_order.menu_id
-- WHERE (person.address = 'Moscow' OR person.address = 'Samara') AND (gender)
SELECT name FROM person
    JOIN (SELECT person_id AS person_id FROM menu
JOIN person_order
    ON menu.id = person_order.menu_id
WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS selected_table
ON person.id = person_id
WHERE person.gender = 'male' AND (person.address = 'Moscow' OR person.address = 'Samara')
ORDER BY 1 DESC