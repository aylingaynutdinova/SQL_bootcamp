SELECT pizza_name, pizzeria.name AS pizzeria_name, price FROM menu
FULL OUTER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY 1, 2