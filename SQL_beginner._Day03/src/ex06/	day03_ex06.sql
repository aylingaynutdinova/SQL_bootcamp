WITH new_table AS (
    SELECT menu.id, pizzeria_id AS pizzeria_id, pizza_name, price, pizzeria.id, name, rating
    FROM menu
             JOIN pizzeria
                  ON menu.pizzeria_id = pizzeria.id
)

SELECT p1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, p1.price
FROM new_table p1
         INNER JOIN new_table p2
                    ON p1.pizza_name = p2.pizza_name
WHERE p1.price = p2.price
  AND p1.name < p2.name
ORDER BY 1
